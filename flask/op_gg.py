from flask import Flask, render_template, request
import requests
from bs4 import BeautifulSoup

app = Flask(__name__)

@app.route("/search")
def search():
    return render_template('search.html')

@app.route('/opgg')
def opgg():

    userName = request.args.get('userName')
    
    url = 'http://www.op.gg/summoner/userName={}'.format(userName)
    req = requests.get(url).text
    data = BeautifulSoup(req,"html.parser")
    tier = data.select_one("div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div > div.TierRankInfo > div.TierRank").text
    win = data.select_one("div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins").text[:-1]
    

    return render_template('opgg.html', userName=userName, url=url, tier=tier, win=win )


if __name__ == ("__main__"):
    app.run(debug=True)