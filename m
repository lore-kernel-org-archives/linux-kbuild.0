Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B383F9278;
	Wed,  7 Oct 2026 18:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791398394; cv=none; b=OoZgiYQPQKpDczOcb9QTVJ3cbNGe9hnB9SnAIVTObKittZxemTJ3btkhyTiKyxfIKG2ryFwPLON5JzkKmLXyPAUuEw6zz/+eTlE4WmO75EKfHIxz48y6MK2PTbqPHn/kKfn1w9RNCbe8LAeqFN/6QDUr1aDL50I2pENorp4EYTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791398394; c=relaxed/simple;
	bh=UORl/uNa3wGti+ue7KW8x7N+YScZXQNc5JRZ9kK0OaE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TwiTLD7cL/FxueDPGzf7PHZSDc2B6KDArxjhLllIAfrPuI1OgUMEoYadsaImcnGEfUZAikwGeszkXvPbWCwOsy5osOHqgQ0whAVZir07rGFk7axRtwUYL4X0ZCnLQ0W/3/rLU2xx78wooQgQ/5YAlTmttMpmzNpLNEo3gPHSoEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uu9wNbuh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uu9wNbuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721A71F000FF;
	Wed,  7 Oct 2026 18:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791398392;
	bh=MtYGr0EkWaUSjq2uuv4mKWSPQibpHHkHm8hrxLVGzos=;
	h=From:Subject:Date:To:Cc;
	b=Uu9wNbuhGewDapTD+rpmrFOmx3NeJO897BNNLi/XyZtoBrcT8YRl/Q2vPXgrwK2h+
	 P/JzA3Q2BjliFE+nq/fznQ9Bgu2eE6KeBIuBrUYjH33pyLOSBWfQwesjOFugV/SyBD
	 w29fbUg5sY11AzzYhsnmwafz49E4RVsK/ZisFJMGTRp91/ZYADUlyN20Yx/L7B1Vpx
	 ChIGByXnHt/9Wc9pTURSp19kJCL1IhVhAQ1cKatn0xUmtohOipmdHxB4LJ29hUeyu6
	 cjPcKt/Q9vMD0j7dvkeU7PpwVib4t1KoBuRy5+uHrgljNkSpkuHg1XVeGjsm/b5I10
	 3rmotbujlnBrw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v3 0/2] kbuild: Support directory targets for DTBs
Date: Wed, 07 Oct 2026 13:39:39 -0500
Message-Id: <20261007-dtb-dirs-v3-v3-0-b3ab32b64fa6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5EQBBA4atIrVVSfgZxFbHQ3dWUBdKFTCLuP
 s0sv8V7FygHYYU2uSDwKSrrElGkCdhpWEZGcdGQU15lRDW63aCToHgWSNT44eO9sXUJsdgCe/m
 +t67/Ww8zs92fBdz3D2+YDrtvAAAA
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

v3:
 - Convert %.dtbo? rules to single target
 - Convert dtbs rule to use directory target
 - Link to v2: https://lore.kernel.org/all/20251120204812.1983452-4-robh@kernel.org/

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (2):
      kbuild: Convert %.dtb(o) targets to single target rules
      kbuild: Support directory targets for building DTBs

 Makefile               | 32 ++++++++++++++++++++------------
 scripts/Makefile.build |  7 +++++++
 scripts/Makefile.dtbs  |  2 ++
 3 files changed, 29 insertions(+), 12 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261007-dtb-dirs-v3-008fa5ffbc74

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

