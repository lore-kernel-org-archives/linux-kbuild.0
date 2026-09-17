Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A06380FDB;
	Thu, 17 Sep 2026 23:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688765; cv=none; b=JtzvTrcWuFld12ct6vYb5/jFh/8cuXrv25PtBugrZb9TTYRIUycuxsCIpb07X0kjWlSIsLZ5tUsgtd+Csw9ZlYEKSdgsktCbOfJecSx588rjB12HnAffCsi3Sc9UloED87u2vBYinauKnya7HkqPat8OGTTb6xQQkgi2CT8HDOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688765; c=relaxed/simple;
	bh=297+vwgRhcNlw+vs8ZmL7sv+m3Q4dQx/2s8v5e6KYYw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jk6QsANdBBnncqyfLnNlEK1M9Cvossdn3TUEGL4Z27d8MuWnRA+Y6GjpxUyHH2twYz8oua4yjB2O5A15Vhl/XS+X2f4Zp8SP0tC0e14HruykfhiIGOHfs/gF1F1jTu0bqeXApy5Udo3MoeCcm9FLae4OcPUL1dMfs3NNzxnJ4tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amjEzRfL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amjEzRfL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59221F000FF;
	Thu, 17 Sep 2026 23:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789688763;
	bh=aSCeFJcqZhj4HKmQ4+hVRo2gf/DFpHuR45jXObxhfoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=amjEzRfLzC3uhlD0dd1+QcrxAXu0rWWgvDwGVlopeAaCKo3m3lDsZdqi3gIRfsbev
	 AuLGX3KkguBNF+pbC/6ThfyHCilMK23GpwUJH4J+mXHVw0v14CksV6RingEWVpL0Vi
	 9seIl1bBjg98zzdqKpKc8DteNvc2oIjKWWzlRCa5xlxQtF/VpOigsXsf9WzvxXPP4s
	 6Bd03uzdQXoOuZ5XZsBLlVG1AJWmuW/stnRhJopDjlPvktJXL17Bs98/5/0+6yltBA
	 XWEmpD5Z3/k3BpnuRj/vzo4rqXKhH4L6Xg0uTLh/qOO4OYKDxcJfb3oosg87Z9d0fh
	 TxGLpPDp/E7/Q==
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20260804-kconfig-warn-on-dead-select-for-choice-value-v1-1-e5c9a274d291@kernel.org>
References: <20260804-kconfig-warn-on-dead-select-for-choice-value-v1-1-e5c9a274d291@kernel.org>
Subject: Re: [PATCH] kconfig: Warn on dead select or imply for choice
 values
Message-Id: <178968870605.1576026.16347952571926280943.b4-ty@b4>
Date: Thu, 17 Sep 2026 16:45:06 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=862; i=nathan@kernel.org;
 h=from:subject:message-id; bh=297+vwgRhcNlw+vs8ZmL7sv+m3Q4dQx/2s8v5e6KYYw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlrqrcum/am2TJKdOKEZgEmi3+5NkXaF60juF7vZVv2Q
 pmn04Cho5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwkOZnhf9KdEzIt0zua/02Z
 5WsteyIx6GN/m8oZtSLz7aLTzsxRTmNkOPR9/RQVppqneUlKmYfrt7C/tdjK7lKnNOvU/qACUcu
 L7AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Tue, 04 Aug 2026 14:45:32 +0200, Nicolas Schier wrote:
> kconfig: Warn on dead select or imply for choice values

I took the remaining warning to allow us to move this along:

  https://lore.kernel.org/20260917234456.GA1570097@ax162/

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kconfig: Warn on dead select or imply for choice values
      https://git.kernel.org/kbuild/c/47ef078cf9ad3

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


