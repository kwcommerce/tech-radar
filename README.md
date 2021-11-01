# KW Tech Radar

## What is the Tech Radar?
The KW-Tech-Radar is a list of technologies, complemented by an assessment result, called ring assignment. We use four rings with the following semantics:
* **ADOPT** — Technologies we have high confidence in to serve our purpose, also in large scale. Technologies with a usage culture in our KW production environment, low risk and recommended being widely used.
* **TRIAL** — Technologies that we have seen work with success in project work to solve a real problem; first serious usage experience that confirm benefits and can uncover limitations. TRIAL technologies are slightly more risky; some engineers in our organization walked this path and will share knowledge and experiences.
* **ASSESS** — Technologies that are promising and have clear potential value-add for us; technologies worth to invest some research and prototyping efforts in to see if it has impact. ASSESS technologies have higher risks; they are often brand new and highly unproven in our organisation. You will find some engineers that have knowledge in the technology and promote it, you may even find teams that have started a prototyping effort.
* **HOLD** — Technologies not recommended to be used for new projects. Technologies that we think are not (yet) worth to (further) invest in. HOLD technologies should not be used for new projects, but usually can be continued for existing projects.

---

## What is the purpose?
The Tech Radar is a tool to inspire and support Engineering teams at KW to pick the best technologies for new projects; it provides a platform to share knowledge and experience in technologies, to reflect on technology decisions and continuously evolve our technology landscape. Based on the [pioneering work of ThoughtWorks](https://www.thoughtworks.com/radar), our Tech Radar sets out the changes in technologies that are interesting in software development — changes that we think our engineering teams should pay attention to and use in their projects.

---

## How do we maintain it?
The Tech Radar is maintained by our Principal Engineers — who faciliate and drive the technology selection discussions at KW across the Engineering Community. Assignment of technologies to rings is the outcome of ring change proposals, which are discussed and voted on. The Tech Radar is open for contribution for all Engineering teams at KW and depends on their active participation to share lessons learned, pitfalls, and contribute to good practices on using the technologies.

Check out our Engineering Blog for more information on how we approach Technology Selection and use the Tech Radar at KW. 

---
---

## how to maintain it?
* Update the `app/data.json` file
* build the image `make build` 
* push the image to our AWS repository `make basic-push`
* deploy it to AWS `make test-deploy-to-ecs`

this is an example of 'app/data.json'
``` json
{
    "last_update": "2021.11",
    "entries":
    [
        {
        "label": "Angular JS",
        "quadrant": 2,
        "ring": 0
        },
        {
        "label": "PHP 7.2",
        "quadrant": 2,
        "ring": 0
        },
        {
        "label": "PHP 8",
        "quadrant": 2,
        "ring": 0
        }
    ]
}
```

---
#### rings keymap

| rings | Id |
| --- | --- |
| ADOPT | 0 |
| TRIAL | 1 |
| ASSESS | 2 |
| HOLD | 3 |

#### quadrants keymap

| quadrants | Id |
| --- | --- |
| Languages | 0 |
| Infrastructure | 1 |
| Datastores | 2 |
| Data Management | 3 |

