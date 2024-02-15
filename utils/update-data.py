import requests
import pandas as pd
from bs4 import BeautifulSoup

def process_lines(lines):
    i = 0
    processed = []
    while i < len(lines):
        id = lines[i][0]
        name = lines[i][1]
        limit = i + 1 + int(lines[i][2])
        i += 1
        while i < limit:
            processed.append([id, name] + lines[i])
            i += 1
    return(processed)

def main():
    url = 'https://www.aoml.noaa.gov/hrd/hurdat/hurdat2.html'
    columns = ['ID', 'Name', 'Date', 'Time', 'Event', 'Status', 'Latitude',
           'Longitude', 'Maximum Wind', 'Minimum Pressure', 'Radii NE 34kt',
           'Radii SE 34kt', 'Radii SW 34kt', 'Radii NW 34kt', 'Radii NE 50kt',
           'Radii SE 50kt', 'Radii SW 50kt', 'Radii NW 50kt', 'Radii NE 64kt',
           'Radii SE 64kt', 'Radii SW 64kt', 'Radii NW 64kt',
           'Maximum Wind Radius']
    response = requests.get(url)
    response.raise_for_status()
    soup = BeautifulSoup(response.text, 'html.parser')
    lines = [[element.strip() for element in line.split(',')]
         for line in soup.body.pre.text.split('\r\n')
         if len(line.split(',')) > 1]
    df = pd.DataFrame(process_lines(lines), columns=columns)
    try:
        df.to_csv('workshop/atlantic.csv', index=False)
    except OSError:
        df.to_csv('../workshop/atlantic.csv', index=False)

if __name__ == '__main__':
    main()
