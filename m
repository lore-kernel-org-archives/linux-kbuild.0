Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF67C364924;
	Mon,  9 Mar 2026 07:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043012; cv=none; b=tWV6RqxMzmZlqVyooRdP1Tb6z4cWT8uzbOhyH+18BSlc4X0MOt6B4KieiBjk1tqld4KyhqVLI+S9mIdd4Nh6aIPuy9uePMD/MY1IgtJ3tr1A+tPhqM5efbV5e66RFWWpRPgaq6XLRhXPUd3a0hTOfOHuDlzVrj+OfM3SyngoOdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043012; c=relaxed/simple;
	bh=LdNQ3JN8g0by9MZoPIigvqjE791tW2nNAGImao5y4ao=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CXFL9Ut+p+VDC7RyC7UpakfAkzfXztgooz0UAOsSO71W3520YZrlA5Ft6Y62zzWo5oLNtEuZLghEdHFBmsHGbugxhRfzHHQMBx6YRhZUE2oXj+BFhOZF+ks96f80ZJWK92B1M50R2UamKw9M0ydgjvufsDUS1rvUX5figGFLmrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OY5ugxVL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OY5ugxVL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A48C19423;
	Mon,  9 Mar 2026 07:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773043011;
	bh=LdNQ3JN8g0by9MZoPIigvqjE791tW2nNAGImao5y4ao=;
	h=From:Subject:Date:To:Cc:From;
	b=OY5ugxVLPQHSPzGc6GwllIm2xgUeeoWwetxza0VIwTel3P5cU7BkAbdz4hMyUfH3c
	 eU53+qCrxBCTCtZCqKWCyMb3zqG9OeIEc+Pu1eL2GK+kOJfXKy0/ihM6Aj5oEOS5hF
	 RqdBSktkSkocyVjzG/+NzgL992g10Bfwp8nRHgWQSFud8CmyYBBnKdHsWXG0tMrfPk
	 muIu135wCpTPP3c0btRS//CbfR9NCUYil5K+N5Xq5ar1IOFx2rzzTFW6mUQGTQVTYn
	 cjbMwt5CK3U9vRnqo++t1X2/aYMwymhys6qfpogi9iT7fmwQjqNixsRuS5c9zISeqo
	 zTnwPbTXkmf/g==
From: Nicolas Schier <nsc@kernel.org>
Subject: [PATCH 0/2] Move tool for generating initramfs cpio to scripts/
Date: Mon, 09 Mar 2026 08:56:28 +0100
Message-Id: <20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACx9rmkC/x3MQQqDMBAF0KvIrDugAcX0KqWIpF/7F01CJkhBv
 HtDl2/zTjEUwuTenVJw0Jhiw3DrJLzXuEP5ahbXu6l3btRPOqA74sLIuoTMpDWphcJcTT1mj81
 7jMMq7cgFG7////G8rh+ne1cWbwAAAA==
X-Change-ID: 20260225-move-gen_init_cpio-to-scripts-9e89ef99e51a
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Askar Safin <safinaskar@gmail.com>
X-Mailer: b4 0.15-dev-363b9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=LdNQ3JN8g0by9MZoPIigvqjE791tW2nNAGImao5y4ao=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBprn0yHaHpQjsvUBQt6O3rNH0D0xiI07/pYNwmG
 SQCp26dR7GJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaa59MgAKCRAHUgpwFiYS
 aXphEADmnwr/n1NKcDXgo5SkJneoeKHits9MNkIGeBa+uD8n51abb3TO5+ZxBQSdetDs5AzAKMY
 uVCok3mCJt+HtbJaA/ZfIL6pH5PAlEC2jQQHk5fD0yfKY1YFFt+H2Jf3AVLhtNG6926BwTHZQSJ
 AoimjCRPwrUis2bHPz/uu1kz8PxSGP74NbJTDojeDuBYG8HZrnD+VvloWO4XPTtPk/U9UWtknd6
 fEUV8qY4kM5fJdWCu7NgAPDU9wU8dgbmqb6atkZ0OKaTt3XvC6bcrLDXI/3G3gwtAO9ADbGGpor
 IJFbfurDbpyTCvP2h9MUsGHIp3FPRW7/ihv4SRCWMJgXJ1Qo2bH5Dcs3HKJ8v9JUhKB0HiTGsGV
 4Twiq0FoFXFvzJxKRelI2NJOkLSJwM3TGuZODtkQIO+kiNUhyzwByRXSSIKTnjLuS3PTDMvDY4L
 hbkYxtZb+xGDEK/macH+X+TpHvI8z8D0pZryP0Nvnscj2/xL5uf22cstlbOwxNgEqjCDEytSkXH
 PsN1Bx1lR+Z1O0CVv3bpqoec0DXjooD3kF16vfEwNTzxnRThc4uO4WhrSGx+1i3tSkMbdwMSEAM
 lcTN8HkqYfDZDz/Sa9XKjTu/CC6CvwxsLKc0I/j5FI0izafUsE+Pe5XXogx/mAU9sXw6OouX5JN
 sV0Y/AiclaHtAFA==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

initramfs cpio tools had been subject of several recent discussions on
linux-kbuild.  Let's get two minor steps forward by enabling a
top-level target for building gen_init_cpio w/o the need of a valid
kbuild configuration [1] and move the tools for generating the builtin
initramfs from usr/ to scripts/ [2].

Link: https://lore.kernel.org/all/20260220191150.244006-1-safinaskar@gmail.com # [1]
Link: https://lore.kernel.org/all/aSdrCFkUQup3qb-q@derry.ads.avm.de/ # [2]
---
Nicolas Schier (2):
      kbuild: Mark usr_gen_init_cpio as no-dot-config-target
      kbuild: Move gen_init_cpio and gen_initramfs.sh to scripts/

 MAINTAINERS                       | 1 +
 Makefile                          | 9 +++++----
 scripts/.gitignore                | 1 +
 scripts/Makefile                  | 2 ++
 {usr => scripts}/gen_init_cpio.c  | 0
 {usr => scripts}/gen_initramfs.sh | 2 +-
 scripts/remove-stale-files        | 2 ++
 usr/.gitignore                    | 4 +++-
 usr/Makefile                      | 4 +---
 9 files changed, 16 insertions(+), 9 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260225-move-gen_init_cpio-to-scripts-9e89ef99e51a

Best regards,
--  
Nicolas

