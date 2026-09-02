Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954BD408028;
	Wed,  2 Sep 2026 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340079; cv=none; b=W7MTBcN9SEdv7tRfAz79kzMqkJtwJru0cDSdCL0FNENtQuZ7gRQs7pRkESJXAorzEt3nuG4Jd0xq6G13UuGBHUD8s3S+q3KMEZJm/LE8GmchinDnPL7EvumEMfHRKQvz7n6by2EPwbgHOv+k5L+btbA5SUp4pU5ieKfXpz+30lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340079; c=relaxed/simple;
	bh=xdnaNg9GWzM1zDamyfSbJkwPCGlFuPtKYzvJBCt0jlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=liSu3e7L7pwMggUSqbQJ25D+Ii8CSF9k4lUTKImsQEqd/Ho+vanC4qoNwdZySiU+t1RD/mCp0datFj2cmvS9PwwTO/insG5Xj9m6ivWIar225ulI5cunzvbbkZfiyqBpyjT+bqXJ6zWmjG7hPfuscFPycRcPnmaq+p1kDIwvZ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=fMDmng+b; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="fMDmng+b"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA5D93E96A;
	Wed,  2 Sep 2026 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1788340069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifS0OsMMa1f9q5WhJGWavX1uu3sL/65U5Q6QAMZre5g=;
	b=fMDmng+bMd/WKgT6dVorGMtgfDnXpK+bE0hvGdGZ26dIiYkuWBYt2LHn3IWOu7V1AOd7Ew
	BcdCmYsyPIVQbY99uH3/c7YAHue85UqeilzwawWvRp0ZjLJeiJwgthIc/d8Y0PMHso4AKq
	FrXvZJvJhGKCC2c+u5ueYsFRpSx2fQPHr8RvnokmfOjDWiuXj6Nouee0YhALZmIpPd3eH6
	Uysm8Zw6r8c36rF6L0zOHzKHFLaCH0eEwfLhEgixYE5EQUCQdzYS90z+3CcrONajGqBfQk
	+I4PiQgg/WQNgxAYfGB2yC7fyD6/v/6z22LgfzbLjkPt832xAkpLHHqXAPgsEA==
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
Subject: [PATCH v3 2/3] Documentation: dev-tools: update container.rst with config file
Date: Wed,  2 Sep 2026 11:07:38 +0200
Message-ID: <adc9eeb418f026ba2b18c4b2aa1e52443bf6f210.1788340031.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <570dac1c8d7a2befb5578cdd8a2ed63b3769c4c8.1788340031.git.gtucker@gtucker.io>
References: <570dac1c8d7a2befb5578cdd8a2ed63b3769c4c8.1788340031.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: dmFkZTF0oXLhhJ/aZ3k5HZii96DUzWxDqZQ+MD76+RVbbdEY7ElKUo3AA1rbV64DhA6zY59UTuEdFC2h85A0EPOQl+UKSwOF/Zj0zH8TlvpHRhJdKS8I5NserCCx0A1LTA0C3pnO7GFtZDAT2920HXuU6w71tTYFphtBDdQxpy0uNI7aCqE8bRA8/mf9KpjVRuxXBkeyfmHIyANkSyRi7Y01zefC19VKVy0KLhPWxQHkUUINyw1OhMp42URKvU1SE9J5Md4yyQKhBUZFNNFtKKZizEveu0Vse5hCQnKJLZIxQfeLUREIPedmysgwrpQjHAtoNzpBAevGRt9mjYTprfQo8F2/fGQIIcfqUFU4GXrhyPDdn2uHsa64vNjriXE0kkOMXlgW0hZqI0Cg7HmkfaMIl4jIrXS8BRQOMfZQ8U1j/OklrpO1fk1iW/urE+GjZ5xLq8buw0AeYaEZlGYnV1sYCEAwsEN+AeHLw7ATEafC3TwUZBbR4g0AGGX8hEJVh/ZIIJ3V3sSkm52WgL6SItM6lZEW4+hvHwhHSgopuRkx3AZjMvqk3rbyHmYtotEAbGGg/6kxsFK+GqGGDqrvNoYOpJMrmuZTUKmvrxRjRcKa/8yr+ZNkCm9qhaT++DSEYzP92g3eYbUAIf/GdJgP5gG1GynkMg+NOZ+8R9ixzFLzl25MEA
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
index 452415b64662..73945bef329e 100644
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

