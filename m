Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722DE39891F;
	Wed,  2 Sep 2026 09:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341601; cv=none; b=dIjSX5VHfckUzg1I8KcxTn8vYz+aDpMqRRY7X9bO0+wGdGXC/GmH/ThRVBUA0XtWG3+lBr12rdSUD2PIoxV5BDc5F5rPLFl27CH3stqUhNNFcGtnUkPmr9x6C3pgUwbNXLUPIXIWYE+pwXiQ5CXAtv+PwBEd6HtsW2sjC3FrnV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341601; c=relaxed/simple;
	bh=9fgii5oxFWezoBPxGNv/mPjDMS0RVeH9/bCgpl86ygw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+OG8IrYegq5FFyI2oKXVnEDexuGkMQVx5eLJVZCnt6D7VRHRfv2sTyivo5/M31zHWyoCW29T+GQFzM27160YU2d6MmRsjDgB/gttpJLdrX6EJdythT0zGdbeij0Cr8B/MvqPaHzmxhx74MdF+SGr4Hktxsi3sU2dp36GmPLEsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=Q/jE4Qgy; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="Q/jE4Qgy"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 964A33EBF7;
	Wed,  2 Sep 2026 09:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1788341591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOqu7m3MlMrEpV2ZScTC3mnAQ9ooA6zUfLyd9PxMQ/g=;
	b=Q/jE4QgyeIfWBEl9nCQOIhkn3GmOrSHGEQVgiHX7eUOXunVVcIVxGDLINFhKpzYGUTfK96
	XAaCRYBfwEKy8TbSJX9nr0WLB2jfI3EwLGAFXImwp9yD2kbL7ziQ4O/H+CRWhWjL5i0wmk
	pfYRLaHboIT/gkqkciqqKva+RAdwR4KEcngjAswII2rbOKeTM4H6sfluopFpWfE3aLcCCg
	qgjw2ez7y8xG0kB8XdJ1fMOAjqBD9bRqSCb9KQ+63Yujrnwewxb0RbpWxuxYSCm1RFS8RR
	jGf7Ehmcrjo2fLYYDJM99fTq8v/pDsoBGK22vVK8W9bQQvvoZuXkWNGm0z/wZg==
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
Subject: [PATCH RESEND v3 3/3] Documentation: dev-tools: refer to user ID rather than id
Date: Wed,  2 Sep 2026 11:33:02 +0200
Message-ID: <5829187a983bede8359f66ace420a6eb1eeb9ebb.1788341513.git.gtucker@gtucker.io>
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
X-GND-Cause: dmFkZTEphWDMvmke5kmiADlfZRoDWT0imwdr8sYVBDHMNGSBeOaAHt4Wqa8mN46tuI7SZEHsHlJb0XZJIdLpmMWB1o5aYPm1iOaa1bQ2s/FnbuqnmaJ1b8GCacVxKgANuz3Kfxkm23n10xxXeQS4BC5x5GlJC/snTtduSOEHhzJY5HBhP7DUzvF1E1eKl7gngYZXhdBNi+mLaKRIws6X3xSuN/rSI9X/IjQ7+MbXHOi/QOEKeqW/9IeiAoLYaxPd8dIqXH10zkzpXnZNI6/CES6glBE4rnYccy4oxuvGZWIeJfphTaLwj8uE2k4+tZPCH/w+pxVpr5frU6iEq/T+aMPAg3KesmXsSGIBQ6Gl6qKYJJMsJDpCDEsLKuYWyOmI2K9yA3oRBBGq1luWi3njeJhZsaVZgqk0Dtezrjf0/q9XeLpOV5O/38Wzvqt5gol+2t7h0Ua9hTqVwjveU0o885BJur+8xpiIzoQlc/a4ExDSSJ/EkOdlb/07Lhp4znTg7ewAN9mdl7nto3FhGZwTUMqXn2bmCSJVrY9erU0O262EsBoLAMxkG4ztasdoj3HfIKfmbn6RlGovv+ad7JAQMf+dmUWnmL3Q4IsVAggFo3xPkK4sjqAvGl4ywiI6josOIZvwyhvzP17LV9dStUT4ilc3vRGut4t/2OmCtcckJrZfSfa/kA
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
index bc74ed9d3de0..5910a74c3d77 100644
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

