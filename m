Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFE43DB757
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124449; cv=none; b=rcPNiZ/5k/4ZYo7GHRrQESw4nPB+DKp19IdLIrGpZbmfNbRdKe23C/FaXxILTsaZxtRyn24TYFfdZ59hHyy0SLZL55+yn+/HHB/rraBV1NQ96vVMIZlAw/7tX2Yw6/hBLDOKbOYZkzfHzmFM9rr6PnMVZvNkAffe/SEBZEz2c/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124449; c=relaxed/simple;
	bh=smSuJ/px+7jX22fWAm9U1a3KiWafOyR2xaJ7MJE4lXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DfH35X3OgOEmJ3NqPjl0wzAKO2EhOU7hZ+8Sio/wx0T/+Q11NKN1YJqnsxFtinYgB8R5lypUPUhthVgmoxEKCOJNFw+yCnTo06ei4+ZnEjAFDMT5mHzRGtXRjZbOiBULfzrRJiWQeqbZ5Q2kFjjMt8klNHZOh13UWQ2PBaER8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEp/YMNq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEp/YMNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B89C19423;
	Thu, 22 Jan 2026 23:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769124449;
	bh=smSuJ/px+7jX22fWAm9U1a3KiWafOyR2xaJ7MJE4lXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tEp/YMNq8m7oN6usO00Op+II7T/i9NDYJmjT5vTdZmBHvnfY+hglP+gdWxVfzbOaI
	 Wo9W5qdYGTE7CGYQKhD6wZ4Z85IOL29w6CqN7cuL1TGJNtwk299gqLgiq35SEuQmt7
	 VSxzsMwrVJLE7zFvcOTsASPDsj730L6G2dCE+ItlHFfB2fGLpmRqMIqWjXFh5pX6Up
	 nzLcL+JO2b6LRZ7isZ09hvG4X+SlDnSbQM9U0NYWhBAlSr6//wI5Exw/3zTZjQ3IP/
	 m/MaR5Zkrjsnhn0moY0nn0aZCtm71WCKDuc0DL+uqeyNHO6sTyrZgQXufkm7wTh15r
	 IEnn87LtuOC+A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 22 Jan 2026 16:27:21 -0700
Subject: [PATCH 1/3] scripts/container: Turn runtimes class variable into a
 tuple
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-scripts-container-ruff-fixes-v1-1-fd1b928c3f10@kernel.org>
References: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
In-Reply-To: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Guillaume Tucker <gtucker@gtucker.io>
Cc: linux-kbuild@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=nathan@kernel.org;
 h=from:subject:message-id; bh=smSuJ/px+7jX22fWAm9U1a3KiWafOyR2xaJ7MJE4lXo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlFm+K2FoW825ZYft22pusP93mOW9cLThbMM9l8wLTDK
 YnLvDG2o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExk3SOG/04pAT5ey0SeXJD/
 o9xjJfC3XO9ubIemvYjkzdSKsvX6/xgZFjtMKOcX3vI/5ejjh3zHetuVxOo3MjDlpR35Kf/gsxQ
 rLwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

'ruff check --select RUF scripts/container' warns:

  RUF012 Mutable class attributes should be annotated with `typing.ClassVar`
     --> scripts/container:108:16
      |
  106 |     """List of all supported runtimes"""
  107 |
  108 |     runtimes = [PodmanRuntime, DockerRuntime]
      |                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  109 |
  110 |     @classmethod
      |

runtimes is never modified so move from a list to a tuple, clearing up
the warning.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/container | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/container b/scripts/container
index b05333d8530b..dae475c6d262 100755
--- a/scripts/container
+++ b/scripts/container
@@ -105,7 +105,7 @@ class PodmanRuntime(CommonRuntime):
 class Runtimes:
     """List of all supported runtimes"""
 
-    runtimes = [PodmanRuntime, DockerRuntime]
+    runtimes = (PodmanRuntime, DockerRuntime)
 
     @classmethod
     def get_names(cls):

-- 
2.52.0

