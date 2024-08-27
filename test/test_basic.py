from pytest import CaptureFixture
import hello_world


def test_prints_hello_world(capsys: CaptureFixture):
    try:
        hello_world.hello_world()
        captured = capsys.readouterr()
        expected = "Hello, World!"
        assert (
            captured.out == f"{expected}\n"
        ), f"expected [{expected}] but got [{captured.out}]"
    except AttributeError:
        assert False, "hello_world() function is not defined"
