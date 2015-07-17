# Kibana 4.1.x Docker container

This is [Kibana 4.1.1](https://github.com/elastic/kibana) in a minimal 47MB
Docker image. Images are tagged by Kibana versions.

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
