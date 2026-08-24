Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2894403AFD;
	Mon, 24 Aug 2026 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787565969; cv=none; b=OqtcUGGyloI8yyjrnpOjRJQF8a7uyqiqS6AkM7IKRhkHtuL9zlruJhQ8TOvIomdipjnz9Io8k9m3+EqI7dM56hivNAHI/5CO/wfgDsqOzFqIc3XyTej3ZE/I+ebMdOYdmWiL7RIx7cbOUW01iUWCg5RrKK7klYd/2bhfNRW6A/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787565969; c=relaxed/simple;
	bh=n89gxyfi9GTlw2gpxZJBbyCju3OtwzBnoR7HrKFwXw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDjKXewvTssYKl08RyBK0ILLt6ruy0KimvWc/GNwnGrQRSphAIj35vvXrAq1BIU1cWprWxXhb/6GNUgjFrhmHjKE1XBHGEUaj5uPRlclTyQ8SoDgLgL82PldQ7hm+KJ0js6WK+SE5dSEF3t7cpCjvY4B6iMOR68TAXFm+mpTKIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=Z4CIuQS7; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="Z4CIuQS7"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A25FE3EC5F;
	Mon, 24 Aug 2026 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1787565957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nl5nj2dyLj8feaqrv6wqjRChnaJ23iqb7k3L25yRyT8=;
	b=Z4CIuQS75yJACKHAFNKar7qkk4nrHdXRiuU4eTr863eDCcRCzmwr3mZxPYqIhwX9IM6r8/
	7ExaBTjB3TVrJVUbLOS+SqgEycYE31EPFiUffmwF9q/RaxymkHZf7HFy/n1wnEfCxbjweE
	mruNb1w6HBX83vojA1cPDX8vcSQo+1zUv68jT5gWqx0pXX+5soxeMZVfjEJlNvee7GulSD
	gcEVp9GPmR90kVDCbGqQOZNUNwWkcSMovfV832Mnir9A8axNFqR/Q3e+t4c0IXQoLjZxFr
	TzKtioW/2vdk0FGKCLmiH9SE98QFKU/UYM//Qu0K7P2DvQ+egcjjAg6TxzRNhw==
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
Subject: [PATCH 2/2] Documentation: dev-tools: update container.rst with config file
Date: Mon, 24 Aug 2026 12:05:48 +0200
Message-ID: <13dc85e4d0b1b1f6fcfc7782238b137061f2dd7c.1787565460.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
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
X-GND-Cause: dmFkZTFdgo9GXW4KXiuQ99TzGaJpC9677ILr6tf8lNXSF0/do8SjfMh9c+NdYcL5Y5oGa8musRN679hD+p0oOSCOj2vYSVYEfKNBZ7e4zEVWQDcrR40p/hhN8cof5Jgml7fS6O5A8rjT6NxhySZe7Tga5lwB3E5VOY1k+glMeihNihoc9AKj/NAzMtknNeoq7NPZ51hZneDA2MHyWVSiwK1TEsBx8wBsiRcvSfw2ZKf4HpnELxLuyFLP0J4BD6QACTuKJ1Ad7J7QiIafXgvUsEdp5LTt8nE+hPlKFINCktnTC5l/MFCIaSib/cJCmOycwHveHyZhpN8OhUvZ0M67AE/LBwKloj3p7mvj4oky4ejP3I65Zu5j2lk/45aufotMXa0Rv2anMIi0g6JbW+Ep72qbeNEwsMGW4Ev3lHv51bpeDFuX8mCOoW9CVjty3bjsOQh3OlSIEY21l+e7IjYccZHrGJKjEjN59ljCEhkNg5BO6eqQdpGYCTQJXkuf/oWN8CbEZ+ynZgg+IqyiQQvvsMlc6jBzC8yOrMBoZhmrSj1OZthfvV6URYGHkeJaM6wc7Gbu91YFwP6KPa2bBlNNMmdZ6lZ9hqeZsScgJEi/f+hUbf5cneDi4PZdckt7Ir5RM6V0Pd8/BSc1tZCM8iJL3AHiTAk3/Kfy5ADp/zUAe+4SBnLPmA

Update the container.rst documentation page with a new section for the
TOML configuration file, its associated command line options and an
intro paragraph.

Provide a sample config using the TuxMake images with an example to
show how to simplify the command line syntax.

Bump the requirement from Python 3.10 to 3.11 which is when tomllib
was introduced.  Also, Python 3.10 is about to reach its end of life.

Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---
 Documentation/dev-tools/container.rst | 98 ++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
index 452415b64662..5847637e0396 100644
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
+By default, the tool will look for configuration a file named
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

