Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C1E3B3888;
	Mon,  7 Sep 2026 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779423; cv=none; b=qZ3fHOib4IprKeEwU60Y72hGFkbOB05drnHsIxkwKBRH/yOiX0/C9UMxL3WM2j/9FieuZPUl74nAuetI1iEh+Ebs5heO4aiKHfKP2LZhM2ymZw1Ke8+JblLmK9K3RvN3YO830bXcZO2+TDWAIh1wAGBWnd0g7PPTrzIEU6BWBrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779423; c=relaxed/simple;
	bh=B5Nh21/IiuLhViNkDmn+iIz3RWcrMwiTlPR5TRZlQDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXyHFfq8Y4fs0Ftfa3wZa6XWrsj0EoDq9d9f0fbmZQcK51gZjjON0mIWMsLOdE8PAblQrxnZaOJ+rSE/u427JTiFLMHfHcSnSX1gXcLL5A8vukhuwAWuv0osewNkH8R80cBXWUR+3qxKa6pmKMA9ULpNNEn1cANcBfjTzNxWbdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=WjcGyG/J; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="WjcGyG/J"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 115DB3EE2B;
	Mon,  7 Sep 2026 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1788779413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gup6fSzpsm/KqPkXeiGzJyu5jlgk0mbl0LOp5fe0ElE=;
	b=WjcGyG/Jy2alB7CYnsTrcIpBpVx7JgFAv+kJUCyC2fqs6gqhuKUaYETUFzUw6fmoBZ+daw
	dBYUa31YTJrOLTPRzwtnHe8k1kYFsRgY1DEKPTyIIesFCDj9ZW91awunO1aYhU1U07tCRE
	DBdkP+t2kvA6ptu3fT6YlR2eQUcSOlwH9+7olnojH9YH5WvowQ9iDb37B2I7FY3aLObMl6
	flz9rxlFtlNh2yYG/FYX1dUwUpPZqWRZI+QvR1lH3ajjLQCnXI5Mm09i9T2Wl0YA9Rv91c
	WOXXHReI0o0eDrs/vVCvOWsQLIOn10PculfB8s4oAZDJnYY3jbIggDInZzHr2A==
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
Subject: [PATCH v4 2/3] Documentation: dev-tools: update container.rst with config file
Date: Mon,  7 Sep 2026 13:10:05 +0200
Message-ID: <fa2dccdbea6a444ecf25f705ec96c5ad7ebd7497.1788779245.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <68b14a76a4cb2e6437c869bab948983a98acffbd.1788779245.git.gtucker@gtucker.io>
References: <68b14a76a4cb2e6437c869bab948983a98acffbd.1788779245.git.gtucker@gtucker.io>
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
X-GND-Cause: dmFkZTEfJ30n2flPEVxKJMvGCc9k/AxGFCPi3qc8wDoH7fTazTAyYZL7iXI6sOOW29Wfg+na1lZSvVIZvg9czuKgWfEyV79DxiCcPbRadf26MTT+yHoArIt1QKO7qeYjOddwZ5/qPVZMmvC06I3a5ra625Dh2AP/ugauDLj5Z9Lcsvv1vS6cSOWLQgPt6Q9UGGth0qc9Dk6lfxwD6MsbBpcn/nCl+g9MgraLyLgVfqH6zKh9tnxBLcrDtFqeQZzKfSSDCx3InKpas7lce2S0SBX3P9W5r3IulRV/5qgPagmXfpSvqBzDtdMx/Awi2vmcHYuqfUaJv1XfJWsZkt5fAE1+HQpiUD8Jk1DF2DLBqcthDApwKho8yhDCJsexS99JFWP9I4yo3QG1qTRJfVYV4yaeIjZlc14dMRFg1QlqUUBlZWAWtEtLaV3Xc3lKZBTGeJIYJmg2uy5SGZ4GGqW6vqnAJwMqgFsySA/4lMcssCfYGvyVbS+ab+x5Rehusv42iKNj+MqdVfT0v28td9aH4urFWcNxZrhAkNn5r3iM3CdixBF9UkzOCVsbxj6lYYyzPdB8sI/Dfb9IEpushuINKlW/hZ0IMfyKBSNLHXpbH0anUIZWqd2sCgUXewbv5Qbg0mT2tXwn/nlkuYGgDXnpjVnqJoZAkx/KKRwcE/j14v9ggaC0Yg

Update the container.rst documentation page with a new section for the
TOML configuration file, its associated command line options and an
intro paragraph.  Also clarify how UIDs and GIDs are used as a GID can
be set in the config file while a UID is provided on the command line.

Provide a sample config using the TuxMake images with an example to
show how to simplify the command line syntax.

Bump the requirement from Python 3.10 to 3.11 which is when tomllib
was introduced since it is a new dependency.

Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---

Notes:
    Changes in v2:
    - fix typo in configuration file section
    
    Changes in v3:
    - clarify how UID gets used as default value for GID
    
    Changes in v4:
    - update without registry TOML config option

 Documentation/dev-tools/container.rst | 94 ++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
index 9e23f79d5ae1..5c2957da1ec7 100644
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
 
     Container runtime name.  Supported runtimes: ``podman``, ``docker``.
@@ -53,8 +63,8 @@ Available options:
 
     User id to use inside the container.
 
-    If the ``-g`` option is not specified, the user id will also be used for
-    the group id.
+    If the ``-g`` option is not specified and no group id is defined in the
+    configuration file, the user id will also be set as the group id.
 
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
@@ -151,6 +165,11 @@ with user id 1234 which can access the files in the volume but not in the user
 the kernel tree but it is worth highlighting here as it might matter for
 special corner cases.
 
+Group IDs (GID) follow the same logic as user IDs (UID).  When specifying a UID
+via the ``--uid`` option or in the configuration file, the GID takes the same
+value as the UID by default.  A specific GID can be set via ``--gid`` or the
+configuration file.
+
 .. note::
 
    Podman's `Docker compatibility
@@ -225,3 +244,72 @@ To build the HTML documentation, which requires the ``kdocs`` image built with
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
+Then to override the default user, the ``-u`` option can still be used::
+
+  scripts/container -p clang -u0 -- make defconfig
+
+This also illustrates how values take precedence over each other: the runtime
+is loaded from the ``DEFAULT`` section, the image from the ``clang`` section
+and the user ID from the command line ``-u`` option.
-- 
2.47.3

