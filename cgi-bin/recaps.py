#!/usr/bin/env python3
import yaml

yaml_file = 'recaps.yml'
with open(yaml_file) as file:
    recaps = yaml.safe_load(file)

print("Status: 200")
print("Content-Type: text/html")
print()

for recap in recaps:
    print(f'<h2 class="recap__heading">{recap["date"]}</h2>')
    print('<div class="recap__content">')
    print('<dl>')
    for item in recap["items"]:
        print(f'<dt>{item["title"]}</dt>')
        print(f'<dd>{item["content"]}</dd>')
    print('</dl>')
    print('</div>')
