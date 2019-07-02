import pandas as pd
import calmap
import matplotlib.pyplot as plt

df = pd.read_csv('downtimes.log')
df = df.drop(['checked_servers', 'cmd', 'status'], axis=1)

# Create Series from count of dates in log per day
df["date"] = df["date"].apply(pd.to_datetime)
df['day'] = df['date'].apply(lambda x: "%d/%d/%d" % (x.day, x.month, x.year))
df['day']= pd.to_datetime(df['day'])
df = df.groupby(['day']).count()
df = df.iloc[:,0]

# plot heatmap
calmap.yearplot(df, year=2019)
plt.savefig('./heatmap.png')
