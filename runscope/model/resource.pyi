from restkit import Resource


class RunScopeResource(Resource):

    def __getitem__(self, key) -> str: ...

    def data(self) -> dict: ...

    def fetch(self) -> None:
