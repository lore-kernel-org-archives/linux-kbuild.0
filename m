Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBEB40B110;
	Wed,  2 Sep 2026 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340077; cv=none; b=rF8BM4b1fxVclCHpdQpVtFj6zG6adDksZUH9GTHU8ci4eOEgeB0pScudgk8ZzClQdg9BPJ1zC6llMwLyPu+/PEjBISLBNTV7oRpBioTI732ojlO6VSCYrMEc1qPro3WZi+AUTJmIG4uyBpYkPpMOynIGDhpYbYhIWWHAUXeuyNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340077; c=relaxed/simple;
	bh=cfWg5+p97016GiwrCIqJWqS5rTlagMS92tVFTMrwCAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvFQMVtOHDPIi4+IqsjxcUePH5lrXJNAQno/vWm6A91wF76qv6Iql8eIArAeBR4z314J0PBSoY5/0XRKh9m3q2n6iIgu8vWmiHNzGuqWF4VjNG7vXL2ZxzBcVEAN+dyorJJZo3p+18hdevcyHpfjQImTzDRyIvaFjRElJhW1nDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=Gq/C5N6D; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="Gq/C5N6D"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B73243EBC9;
	Wed,  2 Sep 2026 09:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1788340067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oZP+A0n98BfuBE0AUiB3iqBbwQhW4ivURHCwOjzVYA0=;
	b=Gq/C5N6D1u2hLnVPqlW/V2H49g/8wCV2kSkqXUQL+2wQ14YhkKJErCkROpEEF9rY3PMm4Z
	OtNuY593efCsGhgkPR80M9L1Z+XKYOaMJKW40Na9X6XZb9/DW/k8mPyiEkiBKaq+tms6zu
	eQi5gQB7Zvyhcj/l5Lq6jze1MFMZ5xvSxk4LmxikzpnI6fiTrZQSipD9zbZSiTDjgSlQVK
	k5Ldj4KpyBWhwcMLZPO1mhoErar3hRXWrhxGuB8VI/8UAIRyEVXMQZqmAN0Blwsz7NYrva
	V1pwFX6hiDgTx4ExoljlERPj93HKXUDDDXiqGurZy6krEdZaaddnYbBriwQ+Fg==
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
	kernelci@lists.linux.dev,
	automated-testing@lists.yoctoproject.org
Subject: [PATCH v3 1/3] scripts: add TOML config to container tool
Date: Wed,  2 Sep 2026 11:07:37 +0200
Message-ID: <570dac1c8d7a2befb5578cdd8a2ed63b3769c4c8.1788340031.git.gtucker@gtucker.io>
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
X-GND-Cause: dmFkZTGZs2DBi1gzoOEk4RtCAWtdw4Cv+0DxuMhV6gYoQ9Th9iMmC8kM/H1XElxdwiZO/pTyL3/zIyKk0lwAUwYPoHP6k1iThI0MUAlKwrdZWMQ9mpDXlWcFvjL4xGi9W4tHHREumLbpiVLnO/X70rG8SkBw2SZBikyyB4mwSklpDxQtMccj5W9Hz3h8QZ13u93EVu5+IeJqYg1MaXK/mOQiemkeVc2CmjMjQd6gFhZa+x0QNTZki2A4jGPsCTyBxagmDPepPoci8xEWzjaaxeWsnll6pLWTWCq7KDMr5qgMau3IKs9dwCcQkWDSTv9wmJZLOV+moGI/NoRg4bGTkaPfxFdOWs1Q+hMoN58KU6yOhc9g3VT2FQYlQDbNP9IlmKsrYWiax6X6XgsijNPN2Oky27dKNlGuFxGwe8RfTP0LFywBI/mjHzfRG72jjcq5oLM+1YyAMU0XsGAWfyI9u1YqA/Mmf/D4hfoklF6JUmrBr8NtT+S437Df7wYlPK0IXN/sFjkP4CxzXUMvtlAhz8UuhqwmUUOMm4/aBJ5WE9cxTSvS4p6bUyrLuZoUzzF1Fot6BGFts8DML4XOqdAMchlKV2ZxxKm5HCVv24O3OPvQp1NUpq1N8Z7Ard3LxpR+HBzp9d/lhuVan3/P0EzU/+aokHb0Rnh/EylpNw3SKaYRpRtvFg
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
    
    Changes in v3:
    - fix logic when loading config profiles using None
    - fix typo with missing whitespace in help message
    - clarify how UID gets used as default value for GID

 scripts/container | 89 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 77 insertions(+), 12 deletions(-)

diff --git a/scripts/container b/scripts/container
index b05333d8530b..e56bff7ccd3f 100755
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
 
@@ -131,6 +140,43 @@ class Runtimes:
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
@@ -147,13 +193,21 @@ def main(args):
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
@@ -162,18 +216,28 @@ if __name__ == '__main__':
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
@@ -184,9 +248,10 @@ if __name__ == '__main__':
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

