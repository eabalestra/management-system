docker build -f dev.dockerfile -t dev-management-system . &&
docker run -p 3000:3000 -v $(pwd):/rails dev-management-system