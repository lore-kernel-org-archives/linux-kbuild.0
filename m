Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FF7397929;
	Mon, 24 Aug 2026 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787565968; cv=none; b=EiKU0Qqbl653lKe0n8aHC1XPxPr8NTdsYkEIZJSV95F45ubDEgpQs1R1cET3q+KAZFjqbsTRoj3V4GA9tUv1A4NJo2tRppQq+9puWLFoULMNgNuIue4VsU9/gBz9pj3fW659Opq8ra0ZzQbarVKoCTr6oEcX4LlrCviExmD2oA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787565968; c=relaxed/simple;
	bh=4CwM7EWYdHg3PgNpg9gblRJLHG+VNjmpcCtdsFr7CVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E84nBSBfi53TBSa4b9MEhu6+32N2Ea27eIieF2mvd6oONC0EtOAfjY7uXw0fU4yMRkeAMOVr8Dg7SvhT0qK/rcn0/ciMbT6sWEm2zfeikTUkWd22tYG8XHlwQ1F4L3LJOaNL0oHDwR7uUxyRsqGUUO5B75qW/OAIEiGLPGHb2SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=CadK3VPY; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="CadK3VPY"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCB7E3EC1E;
	Mon, 24 Aug 2026 10:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1787565956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HpQJyDryWNsJ4+BVt3c52mjGAweVhhKFwzzcVcyE/z8=;
	b=CadK3VPYOS3qbpO1pUJqO74ouJHQYQZm/1jqueYzbEO884jKgMzRTgfXKct/aHKyucQWX6
	v4xnIrzkk513vqRgn8Iu6mIeMcdvpa3dT+GNQTwjuP6GAMBJKaSZi11fYeFYG4TPMgx3rl
	YYBbHQB5gCF+vgy6YsQiwKiy9mjhx2hALcTRhLoaVGK5U7gXmLMUHzNCSJBWt+gd5DGSQY
	+nQpcaVMdQGUETGu6sEv0K2VPz+Oxu09EkRf2tGmQIwShRn7O0g0cIxPutssl7z0vVCpb4
	9T7Qo+0TpPbGOkdDIntIbw/L4FE0AnSpsRY/bh82YFl5I1w6cgZkx+kS5YWG/g==
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
Subject: [PATCH 1/2] scripts: add TOML config to container tool
Date: Mon, 24 Aug 2026 12:05:47 +0200
Message-ID: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
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
X-GND-Cause: dmFkZTE6b2S6b+oj7uSxZC5pLUQqZ2pegruwOSkdRK/oqgw0D53ObXZpu6P4HwLOhPIsko/55EXPtTrJOQ9eRzP4brfxVhFQAe70wZ6uqcs40Ha7BbXY5fH4Sp2TwsVTSYg+Km1WwZM8ql5QCjQbQtooPdTXdJ3XKp3qRME6TQm3GabKvj9DzFndCstVvRNBuIgZNPADXae4WhphpFxj17mRNQr8MsN4CJ8GIRtIsorXAV0J9i4g8RuN4F90/CR80aINhnBWkGVmHAz1bXkasWPdTWb4ACaE0oOkGjSUT0q8k3tCp3U6Net07qLbgLDaQcf2sHBIbIIcA/cZsFSs5tMiXDYbSKXhR5BQNIkfsXUpyf2xwtnTwRWvu7u9Daj9N+y1lB57cA3NFeBg76ciuaoXJ906M3g06uT1PF3ZIRKOt5gnaqFVsdus6z+b6PB6lmBkGe+ySJU/BwybwX446k7LPyvMUVPjz0YKIaBojm3cVsn9iB1UxSYWShy9xxUp/4lfUMgy608r4GuVEsvqgXSgN/vPaO3dgX//Bo8jXK52sK7RoGJBPQxfqLWcF80/QaZlsI95HkK5Urin+TGo+kw9dqgT8y7XTo/6ztP0ctuJR0/RlQcFpe/Gx44LL1yviEi6RzEZhYLvqVOEYTT/rumhdtHhhRYuN18ShT+KSS6QYJxM1Q

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
 scripts/container | 81 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 70 insertions(+), 11 deletions(-)

diff --git a/scripts/container b/scripts/container
index b05333d8530b..cf126fa13510 100755
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
 
 
@@ -20,10 +22,14 @@ class ContainerRuntime(abc.ABC):
 
     name = None  # Property defined in each implementation class
 
-    def __init__(self, args, logger):
-        self._uid = args.uid or os.getuid()
-        self._gid = args.gid or args.uid or os.getgid()
-        self._env_file = args.env_file
+    def __init__(self, args, config, logger):
+        self._uid = args.uid or config.uid or os.getuid()
+        self._gid = (
+            args.gid or config.gid or
+            args.uid or config.uid or
+            os.getgid()
+        )
+        self._env_file = args.env_file or config.env_file
         self._shell = args.shell
         self._logger = logger
 
@@ -131,6 +137,41 @@ class Runtimes:
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
@@ -147,13 +188,21 @@ def main(args):
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
@@ -162,18 +211,28 @@ if __name__ == '__main__':
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
@@ -184,7 +243,7 @@ if __name__ == '__main__':
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

