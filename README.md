# Framage
Collage app, which allows to create awesome collage. With this app user can get photos from Instagram or from his own photo library and create awesome collages. User can choose from several different templates.
######FEATURES:
- Search in Instagram for new pictures for collage
- Share via email, iMessages, Instagram, Twitter, etc
- 12 templates
- Rounded corners
- Change the border size
- Change the border colour

##App in [App Store](https://itunes.apple.com/us/app/framage/id1002882107?ls=1&mt=8)

##Preview
| Example 1 | Example 2  | 
|---|---|
| ![](https://cloud.githubusercontent.com/assets/8221314/7955384/9ed4cc8a-09e0-11e5-897b-cca2273afe9a.gif)  |  ![](https://cloud.githubusercontent.com/assets/8221314/7955594/35188fe6-09e2-11e5-998d-63381f749a87.gif) |


##How to remove a flag

The flag removal command has the following syntax
```
 -d,--disabled            is flag disabled
 -e,--enabled             is flag enabled
 -f,--flag <arg>          flag name
 -i,--input-file <arg>    input file
 -o,--output-file <arg>   output file (optional)
```
To remove the `container.sendFeedback` flag and replace it with the disabled vlaue, run the following command:
```
./tools/flag-removal/flag-remover  -f container.sendFeedback --disabled -i /Users/ekeren/rollout-workspace/Collage/Collages/AboutViewController.swift -o /Users/ekeren/rollout-workspace/Collage/Collages/AboutViewController_disabled.swift
```

