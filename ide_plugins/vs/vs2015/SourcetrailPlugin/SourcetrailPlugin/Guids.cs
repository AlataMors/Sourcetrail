﻿// Guids.cs
// MUST match guids.h
using System;

namespace CoatiSoftware.SourcetrailPlugin
{
    static class GuidList
    {
        public const string guidSourcetrailPluginPkgString = "acf15780-03b5-440e-a41e-db79b7043fc2";
        public const string guidSourcetrailPluginCmdSetString = "0efb005b-715c-4a62-8a9b-1e5a870e6c34";

        public static readonly Guid guidSourcetrailPluginCmdSet = new Guid(guidSourcetrailPluginCmdSetString);
    };
}