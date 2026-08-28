Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098253CC7CC;
	Fri, 28 Aug 2026 06:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898827; cv=none; b=OxpP5NDnLj8oXUC9qJp2i2io02uUd07Dkzg2Qj57a6A8vmFx1dU/luqtx2RDpClygWU+bdw5TlTTUa+6wo9ULDnusWB3VI1gYTfq7dCFztPI2vQEzRJ/dmxslCYDyz0VmuKSE0OeIPBIckfCp9EZGbSXpgsYr9XrHoica+rIVn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898827; c=relaxed/simple;
	bh=hSFjsCSEQi/8oMkydh2mc4J0VU+KFrCLQ4jlgFSS5OE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ayf3lSU2FzFMvo1E7AjRBNB3dqWwWp6bMIGTC7vjoslAWLnd1msC9pcUix/Fdt4o2mluf8qdAeym4vAj82aoOuKRQTRPLVfcTRgQQlKY9pJbymqkBWRjs1m/m2pO+Mx5UGCf4Z0j1DpGBE+r5qsdO1/s0zxVvPU1YY9nkMtje6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=ehaCmnJr; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="ehaCmnJr"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 581691F481;
	Fri, 28 Aug 2026 06:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1787898815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F8iNV+4Kt9TrVoxH58QexWof63WfyQqIWIXd6Z5LsHI=;
	b=ehaCmnJrjFMncM12VuYeI4SiFWrHW0VPwg8Dt+GNLNfoZqkkt8TKejlRMf1UMLM6MJ1oJo
	S0Jnrc78HPhl1L2gwOSRvlq1uCqWKspG2X4Edq7lJjJj2uv3OG3ixk2bRNNY1Zo8ZTaEOn
	7qteJQUYbjJG+dQfkCZMlYgOmi/Ye+Rgp/zPSTZFZk9wvEdm82XH92GLopLP8LV9JEExNp
	cWQO+mKyEuG/0QI5XzCqD5s3lExImAalFJBBQl+rBKL3CbyDrkY/cKGBNA9d3zVWIH0Amu
	mJyVw0eZ8Gb5w9LF+vf2DovuggJZIu4RyIY/6cwvi+lGCQoPtbzhR2xa1NmwxQ==
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
Subject: [PATCH v2 2/2] Documentation: dev-tools: update container.rst with config file
Date: Fri, 28 Aug 2026 08:33:19 +0200
Message-ID: <ab4d7d231432453d8db89514f32a0718175f13cd.1787896890.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <15e16f175f59ae666036764eb03c40cdf19809c7.1787896890.git.gtucker@gtucker.io>
References: <15e16f175f59ae666036764eb03c40cdf19809c7.1787896890.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: dmFkZTEv+vwblePT8eo6cQKNJ8M3nf8kNgsqTBZpvu+uV+Xv+Z3DU+rlVI8ZmOCEWzwJtOqi7cw6EM5WwZgx1bNjkOsZU+VXOEHMTgJ48pay1aprWGPQkX67BwMIjpMXl5yH07ZOrR+L8cCWUgg5+oXN0bM43TgfsUwFpOIoZaW4hv8YVFx0jGHtruoyes9/6JeXmSbmAm8NgV464HQeuOM1KJWLvN466UH0aXX1eUZuiNxWN/pgqB7OSUPQdDQgnOtlij00J904yslfLcCZcIkGS5IVvsEMkIBZ7mx1nlKSI/30B+sPE/oFrXqL3Mj4kfqff2trwU2CWVTtuSkMaA6y609yqgj4oR4PGhdHYenOy6sA3O4WDSbIEOwycfiEf6Q+CG8GxRFBBGpVyInAhzcEdfEZCnRNlWj7mokSjc5D+gKKQShGhmmVq2OYKaJoSNY8fYgIbHQCF+tJGQunLBdPOPcljcHazeDO19u4HFxI4+d/ENdipK43NshjiO2Q8wKnTfNnuNIrl5cXrG6VOv9CYhvXWiu1AUHxttFGhsir14o6avAHTpTXiJcqBascXWeQKpkV8AwxWVV31GtO86kaik5Rkotic294al/XHyyz+DzCnjcmrLNFOm+CbBY6CjHvN0uDS5JgnK1YIyqNMBa5ryuItq/wqIRDmnYVLUUuRA7ziQ
X-GND-State: clean

Update the container.rst documentation page with a new section for the
TOML configuration file, its associated command line options and an
intro paragraph.

Provide a sample config using the TuxMake images with an example to
show how to simplify the command line syntax.

Bump the requirement from Python 3.10 to 3.11 which is when tomllib
was introduced.  Also, Python 3.10 is about to reach its end of life.

Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---

Notes:
    Changes in v2:
    - fix typo in configuration file section

 Documentation/dev-tools/container.rst | 98 ++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
index 452415b64662..5f55278b9948 100644
--- a/Documentation/dev-tools/container.rst
+++ b/Documentation/dev-tools/container.rst
@@ -26,6 +26,11 @@ Command line syntax::
 
 Available options:
 
+``-c, --config-file CONFIG_FILE``
+
+    Path to the config file.  If not specified, the default is to look for
+    ``.container.toml`` in the current working directory.
+
 ``-e, --env-file ENV_FILE``
 
     Path to an environment file to load in the container.
@@ -38,6 +43,11 @@ Available options:
 
     Container image name (required).
 
+``-p, --config-profile CONFIG_PROFILE``
+
+    Profile section to use in the config file.  This will override any values
+    defined in the ``DEFAULT`` section.
+
 ``-r, --runtime RUNTIME``
 
     Container runtime name.  Supported runtimes: ``docker``, ``podman``.
@@ -53,8 +63,8 @@ Available options:
 
     User id to use inside the container.
 
-    If the ``-g`` option is not specified, the user id will also be used for
-    the group id.
+    If the ``-g`` option is not specified, the user id will also be set as the
+    group id.
 
 ``-v, --verbose``
 
@@ -86,9 +96,13 @@ container with SIGINT (Ctrl-C).  To run commands interactively with a TTY, the
 shell directly rather than the parent ``container`` process.  To exit an
 interactive shell, use Ctrl-D or ``exit``.
 
+A :ref:`configuration file<config_file>` may be used to facilitate running
+containers for various use cases.  It also removes the burden of repeatedly
+providing the same options on the command line.
+
 .. note::
 
-   The only host requirement aside from a container runtime is Python 3.10 or
+   The only host requirement aside from a container runtime is Python 3.11 or
    later.
 
 .. note::
@@ -225,3 +239,81 @@ To build the HTML documentation, which requires the ``kdocs`` image built with
 ``make PREFIX=kernel.org/ extra`` as it's not a compiler toolchain::
 
   scripts/container -i kernel.org/kdocs make htmldocs
+
+.. _config_file:
+
+Configuration File
+==================
+
+By default, the tool will look for a configuration file named
+``.container.toml`` in the current working directory.  If not found, it will be
+silently ignored as it's not required.  Alternatively, any other path can be
+specified with the ``-c`` option in which case the file needs to be present or
+an error will be raised.
+
+Its data follows the standard TOML format and is made up of different sections
+with ``DEFAULT`` as the default one.  Other sections may be used to define
+alternative profiles under arbitrary names which can be selected by the ``-p``
+option.  Command line options take precedence over configuration values, and
+profile sections take precedence over the default one.
+
+Supported options in each section are:
+
+``env_file``
+
+    Path to an environment file to load in the container, equivalent to the
+    ``-e`` command line option.
+
+``image``
+
+    Name of the container image to use, equivalent to the ``-i`` command line
+    option.
+
+``registry``
+
+    Name of the container image registry to use.  This will be used as a prefix
+    before the image name with a ``/`` separator.
+
+    For example, a ``docker.io`` registry and a ``myuser/myimage`` image will
+    result in ``docker.io/myuser/myimage`` as the full image path.
+
+``runtime``
+
+    Name of the container runtime, equivalent to the ``-r`` command line option.
+
+``uid`` / ``gid`` (integers)
+
+    User and group id numbers to use inside the container, equivalents to the
+    ``-u`` and ``-g`` command line options respectively.
+
+
+Here's a sample configuration with an extra ``clang`` profile::
+
+  [DEFAULT]
+  runtime = "podman"
+  registry = "docker.io"
+  image = "tuxmake/korg-gcc"
+
+  [clang]
+  image = "tuxmake/korg-clang"
+  env_file = ".clang.env"
+
+It mentions a ``.clang.env`` file which simply contains this flag::
+
+  LLVM=1
+
+Let's take a look again at this example mentioned earlier::
+
+  scripts/container -i docker.io/tuxmake/korg-clang -- make LLVM=1 defconfig
+
+Using the configuration file, it can now be simplified into this::
+
+  scripts/container -p clang -- make defconfig
+
+Then to override the default runtime, the ``-r`` option can still be used::
+
+  scripts/container -p clang -r docker -- make defconfig
+
+This also illustrates how values take precedence over each other: the registry
+is loaded from the ``DEFAULT`` section, the image from the ``clang`` section
+and the runtime from the command line ``-r`` option.
-- 
2.47.3

