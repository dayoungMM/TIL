import requests
from bs4 import BeautifulSoup
url = 'http://www.op.gg/summoner/userName=hide+on+bush'
req = requests.get(url).text
data = BeautifulSoup(req,"html.parser")
tier = data.select_one("div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div > div.TierRankInfo > div.TierRank").text
win = data.select_one("div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins").text[:-1]
print(tier)
print(win)