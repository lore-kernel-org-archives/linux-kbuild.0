Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52555409273;
	Mon,  7 Sep 2026 11:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779424; cv=none; b=GPwFPAh91wYIgHETCeyqQavPcBRa1FNw3iDBGCOn3SUFcb1N3FNyPCKd3nJ6/e6VNXZ32iPTtfw9A73nGM/w8ewfIJVCADkp1iTdkDAH6/be8FufKyArNUUNB4cp3CVAaQfQNo4p1qo4IbO63EKfVIvQJ8QPctGzyJwJqWorOJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779424; c=relaxed/simple;
	bh=8KOCIqbGCcAaCsYNh6VBanLe/XQcKRZmlOIQAK5SSdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hnJ1215X4sZZYHFzd57eF00OBR8RI6hqKOy2T4loY08X1Zu6APg6uFgEKZ/lRzWJPbImRNqXd8iPFwTS3v0kv0jDOJXHtlQ0lkvDbUUMW4i0OrkvP/ByAYph0UIW9FJ5Un7DI7kXlD0l4xxXcfxvJoJnXF/OeS4FSF+Rz6s1SR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=KxrSsN63; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="KxrSsN63"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 788D83EDFB;
	Mon,  7 Sep 2026 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1788779414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RI7S+0rgBA5kP+wlTLpQxQsJeegAm+Kbw6tOkonnoS4=;
	b=KxrSsN63yCyoUnW6w7R6y2gzsjehg8p9dnI+82LS4jVKRcYNfH06SJuzk/2haIU9K3LTU3
	ok/E/LlDteMfP5xh/bGdckVS/Xa3m/njJaW6kRlK/ygHNL1Y2OWuDv+NjTAr+QMp36UfsE
	s+bBMtq/krvuAWrAbomKhtR4eiSm+kX584r/Fv9SKsaX/w6zpMvU1IeOEIa87bWjHkQ2e7
	rWke2jC7HWE/5PKG4Lu6H27aqpygChf3VK5/j601akjD0n0Quev1K779ae8meZ7OTH7Swm
	PGDbSeSWIpuJRfvrEvAWAw7MV1+4p8R2I5bBgQ1a2RH7cokNfRFD429XEtmO9g==
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
Subject: [PATCH v4 3/3] Documentation: dev-tools: refer to user ID rather than id
Date: Mon,  7 Sep 2026 13:10:06 +0200
Message-ID: <5585f8bc5c64e005aa8e4b7651f7cbcac0d93ad3.1788779245.git.gtucker@gtucker.io>
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
X-GND-Cause: dmFkZTFnHr60Sm/qV9Jz9A+bocXjRyABUch8i4wGVL/yW72gikdeI8cW0Iu29rbEuD1FK3Q8WjWk+BmHmZBcV9C19JTXXS3A3/5OvFLrnwK0T43+aXxuo2uP7cuHeYTZl9HL9UlZDO+U41G7i3f9jYwAcX1QfVM0yagxnCT58Cq+yXgKojJ/gBt0BZVodIQvqr2pf5UOosiixqjDaFe6CdYib/fd7TKBtTb6L6bj/WEoeQO0tSWqrSL2udu3LceyaD+454kJAMs4xEExq6A6EpNIIqvgXuRrHBkA4Ii4rL7yjpdN8Te1/UylVIIRFzqmeHoAS2WjwHmoVD3Gm4/PL1Ld5SvMILeKfdhJXTQeHwljOv8S/Rss+HxndoyISx0li+ZdLugOvBhuo40BFCuqH8xdAfGD1ZQfAqm9ADuZxuCEs+DAK3p7uCQtZSj+fLco4rre1sWUbtRebzkYCyjVFinK495Ry6caE9ik1r4C01en+7xA+idJ4yXenuksyz8A2VZS1HFqbkrSGwNVrFoLd/KylbfALdw2rN3ZjNc9Ymrs34SKoPl8PR+Q8cSqcJWSETp5UN9d+ul8ALLIswYM6wVc/nYORYtZJznOUhunInkdWz0MWY9EI7bykOCfJdoJFBabG2X/ncjfe6udWdGAKZ8QqROfEnqK2fgh1/mjImap1wBdqw

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
index 5c2957da1ec7..5dde95f6b222 100644
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
@@ -280,7 +280,7 @@ Supported options in each section are:
 
 ``uid`` / ``gid`` (integers)
 
-    User and group id numbers to use inside the container, equivalents to the
+    User and group ID numbers to use inside the container, equivalents to the
     ``-u`` and ``-g`` command line options respectively.
 
 
-- 
2.47.3

