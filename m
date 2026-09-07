Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8130EF86;
	Mon,  7 Sep 2026 11:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779422; cv=none; b=cVLiryA7ffVrInoIqBrE6uuX6drEp9RLQmvypCFZVkb2iX7ZtOzBMtWsWtlpfCNThGqfCGKbZGhxuVdm8UXlLOUjY3lNPvbl6JsCpKjQrgoxutYCZnISVUoZ8Jmzplrxgi4u+zoThdf01ZEnmud9UtCY8x6AcQGHU4zIIYCR4Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779422; c=relaxed/simple;
	bh=Com8hHcd/m0pNlNIdW221q9lBCUOriZPp8iAYWACyM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jOWfafau99mB3367I1itWrl9nElYmqsZFEdQf37t+rpGQWMPerYHfTBy1KzVX8QtRVCkYCG5L8BMT1IlclGpNEPOQK4zA6QnqvlAA72MMy17UpDLcNq5bjZSckE5TMEdTz/LJ26yzX0gohX7ahvDa9+o/6KnifUSSkJuVm+Tp/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=o0wtUB8X; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="o0wtUB8X"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1616B3EE29;
	Mon,  7 Sep 2026 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1788779411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r+9BvTyljuQ53IijZuMHMI8IRoWjcStRqs3C/wS5SUg=;
	b=o0wtUB8XfKOUsby8Q+mSAaudb+49boVN/fWroxz4TD5sm12+rKlG/R32h4r8kVBWU617xE
	3187P/bW22kx7vDkDfRLFQA1zDOkANeGSNVZr2IyZ086rVPIBmqslcoF4vR+EOKKWBp6ga
	DNmqDprspgQ/CP6fjWb1PI9c9BvOoZAN73WSlAnIXDWqIoMdnII/HAgs71jEaYXWoGVQSn
	LrME4VBvlk3hVfhdFQsBqwKmE1TzePKv9jtNE+L365YKDq28PXdlZEoa03i33TSscEZBee
	fETokN5y/0dgLCHt97jBCth7870kwxrLMdqa4L9OCoA3IeW7ydDxOZOfcY42PQ==
From: Guillaume Tucker <gtucker@gtucker.io>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-doc@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	kernelci@lists.linux.dev,
	automated-testing@lists.yoctoproject.org
Subject: [PATCH v4 1/3] scripts: add TOML config to container tool
Date: Mon,  7 Sep 2026 13:10:04 +0200
Message-ID: <68b14a76a4cb2e6437c869bab948983a98acffbd.1788779245.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTEOBimbCyS5DOu7aP1uZbGXemZq1WI0Fxw4em138uzh5L8e/Xma3SYJ2gRjT54LChn+Q+VhWntxJZlvUmoWrifgsBlFsYt9EP430VXD+dFJsJRx7hWy9YCZF3SWzdFckyvcRp9V/hV1YBa1lZg++3A/3wZStwJVmptEiU+ReNHeZL9xNMtBY7D166oTRI4/B+WjH/U9Q+cbdoPdCbIrGRihg23YTF89uMZGYVvhnDcyB9p7ZgT+jtQXRg3xeorNGU2o/6YTUHjhzNBYrDH3Kw6VDb8o6labUNaeGbejp48jItE7zFnxq+V0/twsxv4DO2LhROgDVFRXqm9wk9tkRZ4LoG6lXNZdPvyvCwAU8MLVhRJPAgBdPwDHsgDi2dvjRUcb5bruzbPRqTeP6FUKw0xyN5W0XFnp8Sf3gPQR08l9475wD+aF7Gr7lg7hWOVOvM30s65hW+SpJLWyyRVK1G3NE5kJ/AT82nGZ+Jnkkjtzg6VvDbG3kYIwf/k9T45D5K7JlWxoXWC/qyyrcxnnHG3AnYbqIqiXOtJAaoReBtXTwYVgDKkz+xae4AJe8QNdue2/jeM5xPJ+FP2PhZfz1LrR/z15ol5zYrPS8n16yZ/UJH3/wEzEoq0iKrR97JybnpMhjMRQ2uGCKTvZVCvb+YU845DR0RaoVajTA6TNM94qDw

Add support for a TOML configuration file to the scripts/container
tool.  This improves user experience by not having to keep passing the
same command line options all the time or overly relying on built-in
default values.  Include the concept of 'profiles' with different
named sections in the file to cover various use cases.

Command line options take precedence over the config file, and values
defined in profile sections take precedence over the default one.

Add a -c option to override the location of the .container.toml config
file which should otherwise be located in the current working
directory.  If not found, the file is silently ignored as it is not
strictly required unless the -c option is used.

Add a -p option to choose a particular profile section in the config
file rather than the default.

Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
Acked-by: Nicolas Schier <n.schier@fritz.com>
---

Notes:
    Changes in v2:
    - fix uid / gid handling when set to 0 (root)
    
    Changes in v3:
    - fix logic when loading config profiles using None
    - fix typo with missing whitespace in help message
    - clarify how UID gets used as default value for GID
    
    Changes in v4:
    - drop registry option from TOML config

 scripts/container | 86 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 74 insertions(+), 12 deletions(-)

diff --git a/scripts/container b/scripts/container
index b05333d8530b..a3a55180d6ed 100755
--- a/scripts/container
+++ b/scripts/container
@@ -1,17 +1,19 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0-only
-# Copyright (C) 2025 Guillaume Tucker
+# Copyright (C) 2025-2026 Guillaume Tucker
 
 """Containerized builds"""
 
 import abc
 import argparse
+import dataclasses
 import logging
 import os
 import pathlib
 import shutil
 import subprocess
 import sys
+import tomllib
 import uuid
 
 
@@ -20,10 +22,17 @@ class ContainerRuntime(abc.ABC):
 
     name = None  # Property defined in each implementation class
 
-    def __init__(self, args, logger):
-        self._uid = args.uid or os.getuid()
-        self._gid = args.gid or args.uid or os.getgid()
-        self._env_file = args.env_file
+    def __init__(self, args, config, logger):
+        def _first_not_none(*args):
+            return next((item for item in args if item is not None))
+
+        self._uid = _first_not_none(
+            args.uid, config.uid, os.getuid()
+        )
+        self._gid = _first_not_none(
+            args.gid, config.gid, args.uid, config.uid, os.getgid()
+        )
+        self._env_file = args.env_file or config.env_file
         self._shell = args.shell
         self._logger = logger
 
@@ -131,6 +140,42 @@ class Runtimes:
         raise ValueError("no runtime found")
 
 
+@dataclasses.dataclass
+class Config:
+    """Container configuration"""
+    image: str = None
+    runtime: str = None
+    env_file: str = None
+    uid: int = None
+    gid: int = None
+
+    @classmethod
+    def from_toml(cls, config_file_path, profile_name):
+        """Create a config object from a TOML file"""
+        if not config_file_path:
+            config_file_path = '.container.toml'
+            if not os.path.exists(config_file_path):
+                return cls()
+        elif not os.path.exists(config_file_path):
+            raise ValueError(f"config file not found: {config_file_path}")
+        with open(config_file_path, 'rb') as config_file:
+            config = tomllib.load(config_file)
+        default = config.get('DEFAULT', {})
+        if not profile_name:
+            profile = {}
+        else:
+            profile = config.get(profile_name)
+            if profile is None:
+                raise ValueError(f"unknown profile: {profile_name}")
+        kwargs = {
+            name: type(value) for (name, type, value) in (
+                (op.name, op.type, profile.get(op.name, default.get(op.name)))
+                for op in dataclasses.fields(cls)
+            ) if value is not None
+        }
+        return cls(**kwargs)
+
+
 def _get_logger(verbose):
     """Set up a logger with the appropriate level"""
     logger = logging.getLogger('container')
@@ -147,13 +192,19 @@ def main(args):
     """Main entry point for the container tool"""
     logger = _get_logger(args.verbose)
     try:
-        cls = Runtimes.get(args.runtime) if args.runtime else Runtimes.find()
+        config = Config.from_toml(args.config_file, args.config_profile)
+        runtime = args.runtime or config.runtime
+        cls = Runtimes.get(runtime) if runtime else Runtimes.find()
     except ValueError as ex:
         logger.error(ex)
         return 1
     logger.debug("runtime: %s", cls.name)
-    logger.debug("image: %s", args.image)
-    return cls(args, logger).run(args.image, args.cmd)
+    image = args.image or config.image
+    if not image:
+        logger.error("no image specified")
+        return 1
+    logger.debug("image: %s", image)
+    return cls(args, config, logger).run(image, args.cmd)
 
 
 if __name__ == '__main__':
@@ -162,18 +213,28 @@ if __name__ == '__main__':
         description="See the documentation for more details: "
         "https://docs.kernel.org/dev-tools/container.html"
     )
+    parser.add_argument(
+        '-c', '--config-file',
+        help="Path to the config file.  If not specified, the default is to "
+        "look for .container.toml in the current working directory."
+    )
     parser.add_argument(
         '-e', '--env-file',
         help="Path to an environment file to load in the container."
     )
     parser.add_argument(
-        '-g', '--gid',
+        '-g', '--gid', type=int,
         help="Group ID to use inside the container."
     )
     parser.add_argument(
-        '-i', '--image', required=True,
+        '-i', '--image',
         help="Container image name."
     )
+    parser.add_argument(
+        '-p', '--config-profile',
+        help="Profile section to use in the config file.  This will override "
+        "any values defined in the DEFAULT section."
+    )
     parser.add_argument(
         '-r', '--runtime', choices=Runtimes.get_names(),
         help="Container runtime name.  If not specified, the first one found "
@@ -184,9 +245,10 @@ if __name__ == '__main__':
         help="Run the container in an interactive shell."
     )
     parser.add_argument(
-        '-u', '--uid',
+        '-u', '--uid', type=int,
         help="User ID to use inside the container.  If the -g option is not "
-        "specified, the user ID will also be set as the group ID."
+        "specified and no group ID is defined in the configuration file, the "
+        "user ID will also be set as the group ID."
     )
     parser.add_argument(
         '-v', '--verbose', action='store_true',
-- 
2.47.3

