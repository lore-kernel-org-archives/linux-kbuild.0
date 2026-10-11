Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17C9349CE7;
	Sun, 11 Oct 2026 20:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791752065; cv=none; b=oCpUfWJMxYUrQIYAp1lS8hp0BEoSaw5E6rrcY3qF6RqkHk6Ey5Peqy5l4pWSzUsxLdX4bgCbJhHBpqWx3/uNSc6hknk5oH606xxNM4Ngp9IDOcXOcVzdNIEnLD1pKdRGWb0ORNRwMENyYGFDme9UNsVN9nbFRowhlCrrOvXMPBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791752065; c=relaxed/simple;
	bh=JTIcU554OR2ESVPmXHlt2oedY/y/CaYJliMg28t46YE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KiZAdmYev1OqKb/mmxLhsZwl0KBx4lE7fVU770IiJ/eMaONiyhxHyY8GtbydVMZOyGZSan/6Gp1yBnGNwhiESyOK3qLbFK34Ub7ZTEekHwAvFf0t4A+AjIus5+VJ+5AIIYd2JOriTfg0nA0OXer23nr72lArHBULT9gclHbGMiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=JGfKh4zg; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="JGfKh4zg"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69CA83F0B4;
	Sun, 11 Oct 2026 20:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1791752060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zoPRzStHoOVfmuxoHzCsy1sYSZjHrN4+MQLYC4TTUuc=;
	b=JGfKh4zgwlhfsUU79+2V92o6DWm1Rnn5HlwaNMUEn+xj3sQrRTj4uPZtHmhrjk4KFcogSC
	9SziAYUx7MqjkwNBN3G8sinc/YIg4mH6VukzbfMLXWIaPsPHNc10m500a/0vExaAQwCHuK
	4eryi/M1eRoMIRJpDhQ0illRCCbZBo2oZGJuRi3ZneDFEP++UY82bfrSc+ovQ431p/RVW0
	U4XvFHlATs3Yk0cgnIjobEUeq7fn392gNDDlt+LDZXmSAHmdK64ZBtb+OCCQPCMzuNZUTw
	lcVJbNf1QqRiDwrpuQejxwhUmqxS28UHd5VLlNYOchWvFG3KDSHSeY7j7wZwWQ==
From: Guillaume Tucker <gtucker@gtucker.io>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-doc@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] scripts: add --registry option to container tool
Date: Sun, 11 Oct 2026 22:54:10 +0200
Message-ID: <06ee7c694c3e9716bff5c9b1b8e9dc95cc0b38d3.1791751900.git.gtucker@gtucker.io>
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
X-GND-Cause: dmFkZTEvQfLfg9bCPT8Uzu+T8gnbhWeH/iUDCI+WTkJyvTcK50ICjWN2StOt0OezRpsfclNB93NiXBTJoKquPIsg+0CG0e12hMp8TssYiDuaWABloDbbzbUF14AJe9GDxxf22VuTtnaqss2ATjVAdsCCCGQ6pApDxDPeo3TcOjKBzooJt1/aS0Cotx2xn7XnxUUrBMwj8kHBK7eOvf/9ljoq67+Pq/Cx59PInVLBbDsmeQOtrCNNdLLTrgPORY3O/REObUjHI5UKC4VWlZpf/99PpiUm87WbfrgD320+qLHCKxRandBFXdLhbPpdNYOAKUHf3NHQJGolyVsGSY8U3mwz2tYwEx3DM5Ot6ekXR904afZE8Ylgu5Hvjw/RD3DSzLnnBmF8piea9Gu1N470IyTp7MfNhGf+ZKnYAYSAnDsReCv8bGpX/yT99HsUEVRQjBtQu57rik32AJx+ot78TadFXA9FZIgVeFfhHIDIv3vj9til9Yj7Hj5t7tPZdaIPVa/PH9oYZ6w/XaqXfHSfg9qNw1cHTwWap2XiYgOX9Cc+kftmnoBaP6450FH5NUPYngZo2K9Q+oy5hvxkV5KJL+DEcDuipfq54NErBsn1BSXtllysq5w498DIQI0y6RMlj6DtBmAjfTi4izpEtM+e4qUNc2kYWuAKzTrgzflOIbiVSbn2QA

Add a --registry / -R command line argument to the container tool to
specify an altnerative image registry and support it in the TOML
configuration file accordingly.

This uses a mechanism based on regular expressions to parse the
container registry and image names and construct the final one based
on a set of priority rules.  A registry can be included directly in an
image name; an empty string means a local image.  It can then be
overridden by explicitly specifying a registry name via the CLI option
or the TOML file, with the CLI option taking precedence as always.

Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---
 scripts/container | 126 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 117 insertions(+), 9 deletions(-)

diff --git a/scripts/container b/scripts/container
index a3a55180d6ed..de72725656a8 100755
--- a/scripts/container
+++ b/scripts/container
@@ -10,6 +10,7 @@ import dataclasses
 import logging
 import os
 import pathlib
+import re
 import shutil
 import subprocess
 import sys
@@ -17,6 +18,89 @@ import tomllib
 import uuid
 
 
+def _init_registry_regex():
+    domain = r'[{anum}][{anum}-]*\.[{anum}\.-]*[{anum}]'.format(anum=r'a-z0-9')
+    ipv6 = r'\[[a-fA-F0-9\:]+\]'
+    port = r'[\d]{1,5}'
+    return rf'((?P<domain>{domain})|(?P<ipv6>{ipv6}))(\:(?P<port>{port}))?'
+
+
+def _init_image_regex():
+    step = r'([{anum}]|[{anum}][a-z0-9_\.\-]*[{anum}])'.format(anum=r'a-z0-9')
+    tag = r'[a-zA-Z0-9_][a-zA-Z0-9_\.\-\/]{0,127}'
+    return rf'(?P<path>{step}(\/{step})*)(\:(?P<tag>{tag}))?'
+
+
+REGISTRY_REGEX = _init_registry_regex()
+IMAGE_REGEX = _init_image_regex()
+
+
+class ImageParserMixin:
+    """Helper mixin to parse container image names"""
+
+    @classmethod
+    def from_fields(cls, fields):
+        """Get an object using a valid subset of fields or None"""
+        kwargs = {}
+        for field in dataclasses.fields(cls):
+            if value := fields.get(field.name):
+                kwargs[field.name] = value
+        return cls(**kwargs) if kwargs else None
+
+    @classmethod
+    def from_name(cls, name):
+        """Get an object using fields in the name matching ._regex or None"""
+        re_match = cls._regex.match(name)
+        return cls.from_fields(re_match.groupdict()) if re_match else None
+
+
+@dataclasses.dataclass
+class RegistryName(ImageParserMixin):
+    """Parsed container registry name with no image"""
+    registry: str = None
+    domain: str = None
+    ipv6: str = None
+    port: str = None
+    _regex = re.compile(rf'^(?P<registry>{REGISTRY_REGEX})$')
+
+
+@dataclasses.dataclass
+class ImageName(ImageParserMixin):
+    """Parsed container image name with no registry"""
+    image: str = None
+    path: str = None
+    tag: str = None
+    _regex = re.compile(rf'^(?P<image>{IMAGE_REGEX})$')
+
+
+@dataclasses.dataclass
+class FullImageName(ImageParserMixin):
+    """Parsed image name including an optional registry"""
+    image: ImageName
+    registry: RegistryName = None
+    _regex = re.compile(
+        rf'^((?P<registry>{REGISTRY_REGEX})\/)?(?P<image>{IMAGE_REGEX})?$'
+    )
+
+    @property
+    def name(self):
+        """Full name in registry/image:tag format with optional registry"""
+        return (
+            '/'.join((self.registry.registry, self.image.image))
+            if self.registry else self.image.image
+        )
+
+    @classmethod
+    def from_name(cls, name):
+        if re_match := cls._regex.match(name):
+            fields = re_match.groupdict()
+            return FullImageName(
+                registry=RegistryName.from_fields(fields),
+                image=ImageName.from_fields(fields),
+            )
+        return None
+
+
 class ContainerRuntime(abc.ABC):
     """Base class for a container runtime implementation"""
 
@@ -145,6 +229,7 @@ class Config:
     """Container configuration"""
     image: str = None
     runtime: str = None
+    registry: str = None
     env_file: str = None
     uid: int = None
     gid: int = None
@@ -188,23 +273,40 @@ def _get_logger(verbose):
     return logger
 
 
+def _get_image(args, config):
+    image_name = args.image or config.image
+    if not image_name:
+        raise ValueError("no image specified")
+    image = FullImageName.from_name(image_name)
+    if image is None:
+        raise ValueError(f"invalid image name: {image_name}")
+    if args.registry == '':
+        image.registry = None
+    elif args.registry is not None:
+        image.registry = RegistryName.from_name(args.registry)
+        if image.registry is None:
+            raise ValueError(f"invalid registry name: {args.registry}")
+    elif config.registry is not None and image.registry is None:
+        image.registry = RegistryName.from_name(config.registry)
+        if image.registry is None:
+            raise ValueError(f"invalid registry name: {config.registry}")
+    return image
+
+
 def main(args):
     """Main entry point for the container tool"""
     logger = _get_logger(args.verbose)
     try:
         config = Config.from_toml(args.config_file, args.config_profile)
-        runtime = args.runtime or config.runtime
-        cls = Runtimes.get(runtime) if runtime else Runtimes.find()
+        runtime_name = args.runtime or config.runtime
+        cls = Runtimes.get(runtime_name) if runtime_name else Runtimes.find()
+        logger.debug("runtime: %s", cls.name)
+        image = _get_image(args, config)
+        logger.debug("image: %s", image.name)
     except ValueError as ex:
         logger.error(ex)
         return 1
-    logger.debug("runtime: %s", cls.name)
-    image = args.image or config.image
-    if not image:
-        logger.error("no image specified")
-        return 1
-    logger.debug("image: %s", image)
-    return cls(args, config, logger).run(image, args.cmd)
+    return cls(args, config, logger).run(image.name, args.cmd)
 
 
 if __name__ == '__main__':
@@ -235,6 +337,12 @@ if __name__ == '__main__':
         help="Profile section to use in the config file.  This will override "
         "any values defined in the DEFAULT section."
     )
+    parser.add_argument(
+        '-R', '--registry', nargs='?', const='',
+        help="Container registry name.  Any registry already included in the "
+        "image name will be replaced or removed when using this option with "
+        "no value."
+    )
     parser.add_argument(
         '-r', '--runtime', choices=Runtimes.get_names(),
         help="Container runtime name.  If not specified, the first one found "
-- 
2.47.3

