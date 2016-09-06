# kibana 4 in docker

This is [kibana 4](https://github.com/elastic/kibana) in a minimal
docker image under 60mb. Images are tagged by kibana versions.

## Running

```
docker run -d -p <host ip>:<host port>:5601 \
    -e KIBANA_ES_URL=<elasticsearch url> bobrik/kibana
```

You could set `KIBANA_INDEX` env variable to set an index for kibana's data.

## No-highlight patch

Kibana has [unresolved issue](https://github.com/elastic/kibana/issues/2782)
that triggers an error if you use long text fields. This image has
patch applied that fixes the problem in tags with postfix `-no-highlighting`.

Once issue is resolved, patch will be removed from this image.
