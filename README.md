```
docker run -it --rm -e PASSWORD=secret -v `pwd`:/workspace bitbldr/code-anywhere
```

Optionally expose port on localhost
```
docker run -it --rm -e PASSWORD=secret -v `pwd`:/workspace -p 8080 bitbldr/code-anywhere
```