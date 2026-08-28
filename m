Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DBB3CB8E5;
	Fri, 28 Aug 2026 06:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898823; cv=none; b=AWj1vJ32L/1q/DJlWZzEruuHRdWU6I/4IVR22/bI6v3Kv5kna1VsLOjgWYd8HbW+N0Hn04He7kIbN6nbEYftMcGBEZ4/RJFJ8JUNdK/C2ln07csH770Crco85iJYt8nO00YaFc9am3YJKdQmmjR3ZOFWUg+en/BCAt5FX5rMrlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898823; c=relaxed/simple;
	bh=gTg4XQjVmVz4Kh134B0Ijy3ozjc1X5GFNXKD4AwZ27k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eAQ47gZzjuf1kj+ckWWV2PADHcl73t2oZ6LpnJzRdeFxDz1hSaKc2XCjPw94y8x3fDNVvFXLn0//OWcD5Kz1fedFON4imLxXAO34toKLQhLOHiQebtqVVki65shE/Ogt0vLhL6U5GXICOt5ZQ7z1Acrlrq2xoBJNWAoYKXv1NME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=hQncp8aS; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="hQncp8aS"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7725E1F47F;
	Fri, 28 Aug 2026 06:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1787898812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ASnAMRDladV1l8gyKbKFY6Vd/6r7kYJr6tUpS2r2NUc=;
	b=hQncp8aSqlWBmrDfy/xXtj6xjUlLaVDqFZbGkkNw0VByDEdY3WAiXHBnxodXFoZYYIzBuz
	A6JfzduhVqMokkxOM77ZqCMWJxRTl7e9C5GZ0uKtIrawfzp5o4/Tr36mO5K2vtKLM68ACb
	VCC9o+eR/RXnjd+j7uF2PjeNXB7M5AaxM8l4rhFwSHDoD2z67yAR2E+4A0OGS6MgvjhkWO
	YQ9inI5xYekxZyLzS054PZVII6w7rYOtofk7vQHULwCylY1UAOYCqOxIDg8NJJgium/1Ve
	H5ng4Ld9HNd0LIwRGp5tNmWRhCWPVuhQeZ4/ZRWknj4VKIvpBiepTW8jb+/Uxw==
From: Guillaume Tucker <gtucker@gtucker.io>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-doc@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org
Subject: [PATCH v2 1/2] scripts: add TOML config to container tool
Date: Fri, 28 Aug 2026 08:33:18 +0200
Message-ID: <15e16f175f59ae666036764eb03c40cdf19809c7.1787896890.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: dmFkZTEniHm/Ptz4XVhRvXZtZIZExTzjiW4dk2mombHGE2jgJ14uj9LBVapMnLnfjdXlv9eAgXryC7GokgiYa4o4gabUHYRQt3V7HMvbak6jmzR9E+d8KeDq8gr38g1CcsAcCmHWbnKIrwofD/absQ/O2nm4vSr2n5ojbm2JePFUzHt4m3zokTBNylOAV22sbCofbrceqDese9xX2RZrH+NwV77DmE1ah6JRta2tdCgzf90By9zWg4RCGAjOu2FQfcMqqi7EdWtHpELmau3uDjSeEK721jaA5kfwRK10jxJcDvWAHjGWE0HbE4qCYQ+LnQIn74ZNeGLYZR997dS6o9tlAROESj81WOe6fF7dC7o7k/y7DxwktKcZ6NEQHDnSg2k54omTuNHpP+VegH6BJIG+/MNTFHO6fe1kjGzTmyzf8NBkEteQeQ/tXXKeJeNNN/2n8NGboCZaUgGV8SXOb9cpXqGinm56l/E73FROxnxa29CIFa4lMxsMtpZt8LVa6rHTnSCbCriznsz7PJnMQxl5ppNyMOpaVKczb+weqefPgY4LPBnzBBgwjJZyzlO/RfGRDar8z/mUUTvDIzNceJOHPekYJs3y9wlAqSa/ckyJp/o6K6bnFjtynUwF12MHPwJuoE246y188Lads+pD8L7wvChesSxNGPoxXoz+l2++rls9Tw
X-GND-State: clean

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
---

Notes:
    Changes in v2:
    - fix uid / gid handling when set to 0 (root)

 scripts/container | 84 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 73 insertions(+), 11 deletions(-)

diff --git a/scripts/container b/scripts/container
index b05333d8530b..72f89f9d17c5 100755
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
 
@@ -131,6 +140,41 @@ class Runtimes:
         raise ValueError("no runtime found")
 
 
+@dataclasses.dataclass
+class Config:
+    """Container configuration"""
+    image: str = None
+    runtime: str = None
+    registry: str = None
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
+        fields = (field.name for field in dataclasses.fields(cls))
+        kwargs = {
+            opt: profile.get(opt) or default.get(opt) for opt in fields
+        }
+        return cls(**kwargs)
+
+
 def _get_logger(verbose):
     """Set up a logger with the appropriate level"""
     logger = logging.getLogger('container')
@@ -147,13 +191,21 @@ def main(args):
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
+    if config.registry:
+        image = '/'.join((config.registry, image))
+    logger.debug("image: %s", image)
+    return cls(args, config, logger).run(image, args.cmd)
 
 
 if __name__ == '__main__':
@@ -162,18 +214,28 @@ if __name__ == '__main__':
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
+        help="Profile section to use in the config file.  This will override"
+        "any values defined in the DEFAULT section."
+    )
     parser.add_argument(
         '-r', '--runtime', choices=Runtimes.get_names(),
         help="Container runtime name.  If not specified, the first one found "
@@ -184,7 +246,7 @@ if __name__ == '__main__':
         help="Run the container in an interactive shell."
     )
     parser.add_argument(
-        '-u', '--uid',
+        '-u', '--uid', type=int,
         help="User ID to use inside the container.  If the -g option is not "
         "specified, the user ID will also be set as the group ID."
     )
-- 
2.47.3

