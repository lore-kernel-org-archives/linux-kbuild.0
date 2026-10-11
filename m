Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F051230F819;
	Sun, 11 Oct 2026 20:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791752066; cv=none; b=arZPVB+ZPDkyizzyglKZFZg0S11+XV6pNu59pUpsxXiW3xYiR066TeK/RMrR75r1aknDSYfkp1e3LQuSTQy8ikc+j3f97qwrITw+vrwLF5Pm5yW83AnZs1cNqtfr++M7efl7XAdPXYzoIKXvgZK5tmOJw1pNwSVtnDvJFjkE7To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791752066; c=relaxed/simple;
	bh=TrgQDVYkD6LEnN4/uKHrUTZXc0tQbzzynlAZ4y19Uzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YzzcVnA8lLmTrt463P85XoV7nJ7YD7Ys8gqacfz0esAlUAtyZEOK/RQi65LHTyuANR7GEYe/xz9w2teZAZnsDDK2XTOL7FqHjBncq0jTCcFXwZEYZIynFiGGDxuY6n1JDsZ7SlXWc0mhuipGaDuywiqTFzqEMKOcdwrJVcDIwVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=neDhq81p; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="neDhq81p"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD6DD3F0CB;
	Sun, 11 Oct 2026 20:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1791752061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdN+oTU5PMaYuecfr2qq7jZHZgaDcxyO3SqoGnXF6EY=;
	b=neDhq81pzs+9ojCvnONP8iR1wKs4EmVFF/IJgnXozPzPMqKmDkZSVC/UpAaHrmnCHtbl6L
	yOIv1q+kJZTg5bqqi7LMcmbzbjar0hXoUBJJDhFD70/KNv4gxk68auRD3PlgulqBXMlEMc
	D59oaQXka43HlARgDS4PTB6G8QUdrhPhG8gGygjKDkaiaZniDYhbieAEr7LUSUX/Ao506D
	JNq2+147W387zvFIOS6v1Nvz6783YEoB3nUNg3iLgoJA7pRcR40UrNAHnoR6F+A/1/pQhh
	Pb4gTbp61G+5AO0WB0rDkmwumd2mvVw2P2mgT/SzrIVq3Yyyisq7nsww5WiFDw==
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
Subject: [PATCH 2/2] Documentation: dev-tools: cover registry option in container.rst
Date: Sun, 11 Oct 2026 22:54:11 +0200
Message-ID: <d7d6735e4b287ae0cb6f873ee8763820cb6e1d7e.1791751900.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <06ee7c694c3e9716bff5c9b1b8e9dc95cc0b38d3.1791751900.git.gtucker@gtucker.io>
References: <06ee7c694c3e9716bff5c9b1b8e9dc95cc0b38d3.1791751900.git.gtucker@gtucker.io>
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
X-GND-Cause: dmFkZTEyBHBhW5frcDZqhuP5Y8gLNmlhU9/NnsCUPS4GCpA2pv+5JEMGMBApPt0hxUmuTXLxIXzMCssGikpcEXJjcfSV4FxuRv+llbYLr0iqZy6uMTOIt/32zCuI4IVtm3d0lFOhYDutX8iI5h1GxWDWTi/4fxs63U64zU2NF66jpl71IuiwtYzdaJ739F6hcRE163yFC+VR+7JkKd8xzMb0g3WO2yK8n8FJQ+D5KmwQBAN7sdfCQzyLVNUBTQAac92LN3B6WcABbqLdfTNtHP6NNDpPvCEaxa4Z7AjKM2ErlkxIxTowCwSFJofFGI5wVMqQj7GdnEwo/Ld9cvkZpyZLTWllXnkeKcmJFf6EoGvGUI4SMQsToCZCiCrjc6C80eoA/xZeKwInBnRid7JEISQq6uzMwgyah90mMaBimwk2+QsyV2saeSsxAD7q/AsadfPl3j1cLp8GeB2G9GnNUZImlGBUEZe+phWMQiBLSIyMGYJQ8vwPhHVanxVR6jMXhTrR79W83hJaPfqG7ki1yqgCw7c4exX+VAlZZO2eWwiK1NIebJNCY0FTi5tKf7TFOtm84S8RWd5K/zs+XGBM/sWKatURE4tK8vwvP3ZT0glB27zHUxTShtj39gCExERIW7MypFA8gU8anuBXWfPvwYTUllENEG2GTiNhiz/nuTJhX5Hg6A

Add the corresponding documentation entry for the new --registry
command line option and TOML configuration file.  Update the examples
accordingly to show how this can be used to override a registry name
already defined within a default image name.

Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---
 Documentation/dev-tools/container.rst | 33 +++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
index 5dde95f6b222..3f2ba1fcf3bf 100644
--- a/Documentation/dev-tools/container.rst
+++ b/Documentation/dev-tools/container.rst
@@ -48,6 +48,13 @@ Available options:
     Profile section to use in the config file.  This will override any values
     defined in the ``DEFAULT`` section.
 
+``-R, --registry REGISTRY``
+
+    Container registry name.
+
+    Any registry already included in the image name will be replaced or removed
+    when using this option with no value.
+
 ``-r, --runtime RUNTIME``
 
     Container runtime name.  Supported runtimes: ``podman``, ``docker``.
@@ -274,6 +281,15 @@ Supported options in each section are:
     Name of the container image to use, equivalent to the ``-i`` command line
     option.
 
+``registry``
+
+    Name of the container image registry to use, equivalent to the ``-R``
+    command line option.  This will be used as a prefix before the image name
+    with a ``/`` separator.
+
+    For example, a ``docker.io`` registry and a ``myuser/myimage`` image will
+    result in ``docker.io/myuser/myimage`` as the full image path.
+
 ``runtime``
 
     Name of the container runtime, equivalent to the ``-r`` command line option.
@@ -288,6 +304,7 @@ Here's a sample configuration with an extra ``clang`` profile::
 
   [DEFAULT]
   runtime = "podman"
+  registry = "docker.io"
   image = "tuxmake/korg-gcc"
 
   [clang]
@@ -306,10 +323,18 @@ Using the configuration file, it can now be simplified into this::
 
   scripts/container -p clang -- make defconfig
 
-Then to override the default user, the ``-u`` option can still be used::
+Then to override the default runtime, the ``-r`` option can still be used::
+
+  scripts/container -p clang -r docker -- make defconfig
+
+Likewise, to override the registry name::
+
+  scripts/container -p clang -R my.registry.com -- make defconfig
+
+Or to not use any registry at all but only a local image::
 
-  scripts/container -p clang -u0 -- make defconfig
+  scripts/container -p clang -R -- make defconfig
 
-This also illustrates how values take precedence over each other: the runtime
+This also illustrates how values take precedence over each other: the registry
 is loaded from the ``DEFAULT`` section, the image from the ``clang`` section
-and the user ID from the command line ``-u`` option.
+and the runtime from the command line ``-r`` option.
-- 
2.47.3

