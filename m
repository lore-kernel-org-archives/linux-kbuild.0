Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED1A41E6C5;
	Wed,  2 Sep 2026 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341599; cv=none; b=fErvAnmhTovIU2brNtyH4UYxiAknXwiMGjGAvkv3vDWYAUrerpgCXyRBaBi3F1kfIjxuS3XQkssIvLoZcbbr96uSR/htTfCCYMLZU2Fbyu0VoSC9srTMuwBD2qyU/6oYVMQobgtXxZYQ70MT+1vegRrW7wQZgoSuKVztdE0c+0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341599; c=relaxed/simple;
	bh=jhmBSzkaPXIEkolqeuBtA5PUJcUvKWa1AHjY7732QK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7StvD07vkp8LC9P81lTEsJMRbfoH3yZuZzrrJApNqZsLjh8SUIXa8ektxLxEZl7vcjvs/oMedmyGKSL4UwHJ35q22iUpzJHRB1Y9BkJA0cLzW6afAMUtX4wf2712j4t/teet1qmPV9Mga+YkiF9Ez8LuExlvW87TIYek8D++Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=UpuuGutf; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="UpuuGutf"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EF393EBFA;
	Wed,  2 Sep 2026 09:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1788341590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UguNOgLS/8DT9/UBXVW6GtKIgDgrsggBCJBgLqBDTTg=;
	b=UpuuGutfxBZgzW+Pk4K3qGc/6d7YccDiEhmIJxZ7SCczqtMuwndT/ClWRDnOTcT2d7jaPQ
	+j6He6HH+nKCqNSqnJbFJJTHIlp0NfInAjIC/Jzv1ehQuTpwcisYe70JDBmdXGSFmqVH51
	IaNdfI2z/2HogDVMgRzO4d+0YqGatWdVcGBqs/NlimL9di/7DNe1BrRulHbl6mSEwGVkJY
	ESw4ah8EuuR2xzjGNCW78xvbqLPQpY9gT/CtLIqCEtysWLDNqoupsEPAn61Lwi/fkx6cGk
	xjLGzMm/1z0+LI8ST9FNhejpOvwPfzBlG+0sUQTOWM1p4B8BDL4/TGhebdT8qQ==
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
Subject: [PATCH RESEND v3 2/3] Documentation: dev-tools: update container.rst with config file
Date: Wed,  2 Sep 2026 11:33:01 +0200
Message-ID: <483be70a3d4827e44c780d123b2d25eb2855c8ed.1788341513.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0a88d9d0ebd73a9f6e72399f93705ebc7b49ae9c.1788341513.git.gtucker@gtucker.io>
References: <0a88d9d0ebd73a9f6e72399f93705ebc7b49ae9c.1788341513.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: dmFkZTF6RtQNvJOwTxK/+zM0Guwd29IKjK6CHmvo7aLGCRP4jJpo9fM9B6BVKrcidMW+zPwwY7uxjHmgR9e8nOF9LjBxU8RB37QSjvvnjQWmjWSyzlmV7PLGbJYHfES1iFz0XT3vEpkrTQdkaf8h9g+nm6Pj/O1YqFTv09snoh6u6gWMd5f7UWvvljT9PXQV5frieBtQQ3gsFSOLFkuMEEs+EnS35lG3++q3sQ2pJc91Ui7FBDpOOW2DIsRrx/tN3bg3kfcWNGQWDMgTo/khCd4LNhOe8aXUKhX6yZHu2eZsp/DiwIBPVFOf14yBBPji+XZdrFRmjwvcTWmjjb+RmweXTUaBBoHlFN8DX18nCV+d3C4jo+mv18EfKq7aJJZfSELSuADqCGzVtnh6cLRpp1SzL/UaKD7mbjni9PV9aqK+ZcOza+TdTmds29H7bB2iH7NimXJ4hyXG9z2lo2AXnbZ8ykuf5gxa2UOFt2jA15BSYOIPynyowLZIFTuY1YO3C7Ck3biwRl9aGmDz8+CCtqlLr9/ph/Md234sDXMFzKeXVWO7c/q3AmsCTdnJtVCceo1zLqjT6d3ReDoPLb2mdA4bVjclvkEhnq+eoM2U/HwOI/hyV968AzzKoIeXPKEESANzXFJNoEHBXIslDujo+d3GlrmGmLAjG5uyOyw32NxyswOaJQ
X-GND-State: clean

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

 Documentation/dev-tools/container.rst | 103 +++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
index 9e23f79d5ae1..bc74ed9d3de0 100644
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
@@ -225,3 +244,81 @@ To build the HTML documentation, which requires the ``kdocs`` image built with
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

