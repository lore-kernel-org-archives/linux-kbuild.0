Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D538040B6EF;
	Wed,  2 Sep 2026 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340081; cv=none; b=tR6noWD0XtypavQ0LS59LlgCGnGmgLgJW2fjDCE54qz3hD90e5wK/e5rKazVrR2cKJjat8R+RB1QmxJcfGNYMTqGNGRXDXO3sBdN/a4nk8J+UBHKO8CaTpCrt/a9NMssPFQ15iOMQDNt4wpydQZ+BN2ZyLKP/f/40mvWEOAZGr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340081; c=relaxed/simple;
	bh=vNNOHnwbx1gPEsJJxg1BTLay1zBD2nFiykHv9DB2Vxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWRlDuUuvsNRbSQtqg+c1cSS+NMhSdsss5HybfZUVdY08PjwmzLJvvf28TeyBmRXQQPJLO+U20FrJ+CtgE/5vcD3o2O9i6OMY5tSK/ESdAlwomVOKSn3dxHMdNJm+Qm0wW2Km8sNLpOe4FewuLAdf74zhQuLDqFZcWdjF1XP09Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=J6xqnAAc; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="J6xqnAAc"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5769F3EC00;
	Wed,  2 Sep 2026 09:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1788340070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEmD8cOklG62khb8CqW/tSwidX5ceLFPiZwKUhKmodc=;
	b=J6xqnAAcrAxsThPpbXCEQVdPdll7o27XGtod1b6F1wf+c+pF+sYYwC2YxGf1RS7PQ/phP3
	yDTfRI9AyBWFJVPott8y4GI/wPBHhpoOvZ9xXKHwNDe8G8XOP8HspHkf3zxxsEqT8Anc0N
	j1wEaFw19+a0c8IXX0otrKHvNzSc8eWhe/ntab9SsC/DE0ht+XUmGRN9IJWnCm1oZZjL/W
	9SPiTfYrIhtHFl6x1w6An79FxcTYGVLkafZr6lyZF48B/h0JZH8qa+MfvooqCemx4Gpz3P
	4FFct24aD5x11LNZrIZdCpulVvXNnI5jWNHiQOmNYtrSAzbxkW2eeL4gaEYyzQ==
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
Subject: [PATCH v3 3/3] Documentation: dev-tools: refer to user ID rather than id
Date: Wed,  2 Sep 2026 11:07:39 +0200
Message-ID: <755614964e10a60a4e431d514f38092be1d3f556.1788340031.git.gtucker@gtucker.io>
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
X-GND-Cause: dmFkZTEqBu4vCMiMzITtIh7EDR6QD3TwQ1vaiWyHqC6QMbIbdx9/0QA8Q12pwQb7q9MF0akoXa6PQQSUYeygor+uqFfB6Texhg/CfOoD+d/MsPdcp2Cdi6RufD4gHzRdhUZofQ66/4q89Gephql2TgwpOotfu5DIWDUZYJ6Gap0bEeVXX3IHf8XDTki26tjhoIDRS4OOPkss34TG5nV7KxcUBS4IQdvPnOwi8pE+7VwPmLZO6/ca49T1B5m/4Gc8WxAv87cvgY6eYzm5cs4RsafVEd+Ta8OeDSb3PfaDpfOlhrZcDCqKwAoDRnoeNqxUJww74mlHHuEJiWZQS2QP9P3oCD1UB1XcA6JN3+zK4Y8xUt05mdQxXN502VubXSHH1gWF4wBOxEOLWaAD25Eav7uqzYib5EGQngXkZguzsJXB42G0uILDWOYs0TL0TsRCrkHuZIGa2SM8p8bnjo/qWbZkGxjqC1Cwfy2AgZ3lYXszr/V6kZha2vhg7EQwg58ipw1NhD9jC7gvmWqALdL6a4G8erLGCMH/AdZ9p2R7x53Om2KbIxiRS1QyUh4B9j90k/lUQqWpKHjD8AS6kDMYB9Z/8TyxumXPWgu7dw/zNIKeHzMidN7NaeLJ8wohonrFxFrdVooMiA2JhP34XaZNoerxZBxh5bnbwA6/NsgmoRpz3sp/cA
X-GND-State: clean

User and group identifiers are commonly known as IDs i.e. UID and GID
written in capital letters rather than lowercase 'id'.  Update the
scripts/container documentation accordingly.

Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---

Notes:
    Changes in v3:
    - added as extra patch to clean up documentation

 Documentation/dev-tools/container.rst | 30 +++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
index 73945bef329e..b325836129fa 100644
--- a/Documentation/dev-tools/container.rst
+++ b/Documentation/dev-tools/container.rst
@@ -11,7 +11,7 @@ various platforms, for example when a test bot has reported an issue which
 requires a specific version of a compiler or an external test suite.  While
 this can already be done by users who are familiar with containers, having a
 dedicated tool in the kernel tree lowers the barrier to entry by solving common
-problems once and for all (e.g. user id management).  It also makes it easier
+problems once and for all (e.g. user ID management).  It also makes it easier
 to share an exact command line leading to a particular result.  The main use
 case is likely to be kernel builds but virtually anything can be run: KUnit,
 checkpatch etc. provided a suitable image is available.
@@ -37,7 +37,7 @@ Available options:
 
 ``-g, --gid GID``
 
-    Group id to use inside the container.
+    Group ID to use inside the container.
 
 ``-i, --image IMAGE``
 
@@ -61,10 +61,10 @@ Available options:
 
 ``-u, --uid UID``
 
-    User id to use inside the container.
+    User ID to use inside the container.
 
-    If the ``-g`` option is not specified and no group id is defined in the
-    configuration file, the user id will also be set as the group id.
+    If the ``-g`` option is not specified and no group ID is defined in the
+    configuration file, the user ID will also be set as the group ID.
 
 ``-v, --verbose``
 
@@ -81,7 +81,7 @@ Usage
 It's entirely up to the user to choose which image to use and the ``CMD``
 arguments are passed directly as an arbitrary command line to run in the
 container.  The tool will take care of mounting the source tree as the current
-working directory and adjust the user and group id as needed.
+working directory and adjust the user and group ID as needed.
 
 The container image which would typically include a compiler toolchain is
 provided by the user and selected via the ``-i`` option.  The container runtime
@@ -145,22 +145,22 @@ User IDs
 
 This is an area where the behaviour will vary slightly depending on the
 container runtime.  The goal is to run commands as the user invoking the tool.
-With Podman, a namespace is created to map the current user id to a different
+With Podman, a namespace is created to map the current user ID to a different
 one in the container (1000 by default).  With Docker, while this is also
 possible with recent versions it requires a special feature to be enabled in
 the daemon so it's not used here for simplicity.  Instead, the container is run
-with the current user id directly.  In both cases, this will provide the same
+with the current user ID directly.  In both cases, this will provide the same
 file permissions for the kernel source tree mounted as a volume.  The only
-difference is that when using Docker without a namespace, the user id may not
+difference is that when using Docker without a namespace, the user ID may not
 be the same as the default one set in the image.
 
-Say, we're using an image which sets up a default user with id 1000 and the
-current user calling the ``container`` tool has id 1234.  The kernel source
+Say, we're using an image which sets up a default user with ID 1000 and the
+current user calling the ``container`` tool has ID 1234.  The kernel source
 tree was checked out by this same user so the files belong to user 1234.  With
-Podman, the container will be running as user id 1000 with a mapping to id 1234
-so that the files from the mounted volume appear to belong to id 1000 inside
+Podman, the container will be running as user ID 1000 with a mapping to ID 1234
+so that the files from the mounted volume appear to belong to ID 1000 inside
 the container.  With Docker and no namespace, the container will be running
-with user id 1234 which can access the files in the volume but not in the user
+with user ID 1234 which can access the files in the volume but not in the user
 1000 home directory.  This shouldn't be an issue when running commands only in
 the kernel tree but it is worth highlighting here as it might matter for
 special corner cases.
@@ -288,7 +288,7 @@ Supported options in each section are:
 
 ``uid`` / ``gid`` (integers)
 
-    User and group id numbers to use inside the container, equivalents to the
+    User and group ID numbers to use inside the container, equivalents to the
     ``-u`` and ``-g`` command line options respectively.
 
 
-- 
2.47.3

