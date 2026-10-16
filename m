Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3403CAE7F;
	Fri, 16 Oct 2026 19:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180186; cv=none; b=SdoHutgWcDKRMT/7tY+1fUjq4ms0YK8sLSef5NBDeS8G7BlJBH7vSqKUUEg6SwWOVrfwFC4fw8btadC92eSLDfAC0bycq52dlUBPggF/tdJsX+qTk+VUBOgRP+0MDjIl0acfsYCQsRzVSD79YQolnesFM7woQvjKEcEFo03b14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180186; c=relaxed/simple;
	bh=dXWngzR0VSwJzmMFU4w+Q+ZFtCd2am2GmYmJI7P03GE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bz8YtuE1RKCE4RgZMFL/QF06B1gngdlFYoF6Q1bEI5PS7yPXMTr9IMLoLrdOkd4gDjWj1CMlMkXSuhP6ZcXxNB86DPG8+6jA7UR/KnqLina8JilhDI9tKkjBx+f0y/vyQZ6TuapEoZP2B+vMJzjV9QevxfW7pVEr+mLYSAorZEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWlBsjIG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWlBsjIG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEC71F000C4;
	Fri, 16 Oct 2026 19:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792180184;
	bh=R2m9A9kAyG6PgLLQyweXO3lhgMUSCdmEFIgCX6Jlf3Y=;
	h=From:Subject:Date:To:Cc;
	b=mWlBsjIGg4BzhOqwIxLTbQdsLiWcnp0NAA1zZ0lQyFNfL0U9LPrJxMwm1Jvhdz0EM
	 DU/rYuRKwQsIRbtrbI8B0jle+MUcycdKBrZI5uqafjASbxt9uJRk+LDODpdS9CrCke
	 cyzgRIwmnj1iliw3ZDrdMeZUbYXDVkmeAJTWUS4skTVa3PvTnRT2q23Ym7+4agD26g
	 UmniRXdBj1bKobNDPfnbcYiLzOOLHRLjSFkw+Gln3lzTooRh0PyjttawPZnyewas4J
	 /FoftSSH52DJArYKuIsdVm7f5NwoLGZSAcT0BEuO+T8xL9n2nLawkQJ9bDuEnK7lZo
	 JicBLVoFrkK0g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v4 0/2] kbuild: Support directory targets for DTBs
Date: Fri, 16 Oct 2026 14:49:18 -0500
Message-Id: <20261016-dtb-dirs-v3-v4-0-0ec42fd8ef9b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0JmbU2lWIwr72FYtGUKo6Y1UyQaw
 t1tcevyJe+/v0BCJkxwrhZgnClRDBmaXQVuNGFAQX1mqGWtD1K2op+s6ImTmJWQ8uTN0Xvr2gb
 y4sno6b3Vrt2P08ve0E0lUYyR0hT5s93Nqnj/yyUurDJW1VY33ujLHTngYx95gG5d1y/Lsj/2u
 QAAAA==
X-Change-ID: 20261007-dtb-dirs-v3-008fa5ffbc74
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, Arnd Bergmann <arnd@arndb.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.16-dev

This series adds support for using directory targets to build DTBs. This 
is primarily useful for architectures with lots of vendor DTS 
subdirectories.

v2 had some issues reported after I applied. In fixing David's issue,
that introduced random parallel build issues Arnd reported. I didn't get
it figured out quickly, so I ended up dropping it. I finally got
around to revisiting it with some LLM help this time. Having multiple 
paths in the build system to building DTBs complicates things, so I've 
reworked things to always use the single target and directory targets 
for building.

Arnd, can you give this a spin on your randconfig builds?
    
Please ack and I'll take this in the DT tree.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v4:
- Don't create dtbs-list files in every directory
- Link to v3: https://patch.msgid.link/20261007-dtb-dirs-v3-v3-0-b3ab32b64fa6@kernel.org

Changes in v3:
 - Convert %.dtbo? rules to single target
 - Convert dtbs rule to use directory target
 - Link to v2: https://lore.kernel.org/all/20251120204812.1983452-4-robh@kernel.org/

---
Rob Herring (Arm) (2):
      kbuild: Convert %.dtb(o) targets to single target rules
      kbuild: Support directory targets for building DTBs

 Makefile                          | 38 ++++++++++++++++++++++++++------------
 drivers/of/unittest-data/Makefile |  5 +++++
 scripts/Makefile.build            |  7 +++++++
 scripts/Makefile.dtbs             |  2 ++
 4 files changed, 40 insertions(+), 12 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261007-dtb-dirs-v3-008fa5ffbc74

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

