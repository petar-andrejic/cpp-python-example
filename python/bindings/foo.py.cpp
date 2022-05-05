#include <pybind11/pybind11.h>

namespace py = pybind11;

#include <example/foo.hpp>

using namespace example;

PYBIND11_MODULE(example4py, m)
{
    m.def("add", &add);
}