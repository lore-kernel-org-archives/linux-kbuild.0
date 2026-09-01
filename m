Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658A42D2385;
	Tue,  1 Sep 2026 00:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788221705; cv=none; b=lh3X0/vqisiFZ+nOPgu5MpYRWgJcBtRQXxNpjtzKza93bid0OXcXc4yIGWbZUOmR5WASu8lfVxdCxpFOQf9IgdY90zEPH3GKSO2DtoQbC8pHrNgU97j+8F7ECEtkl8PHihEmRN8zGDHmjt6CwCnzOZlcBKzN/RCFE9mqxM8SWPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788221705; c=relaxed/simple;
	bh=DsW320seDJszdoatKfzyA+Mn364XpRsiSvkUaA1mCTY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MmvQpOncc/gS4P8GUcmMhylG9jB3w/OR+4A2EEa0O4a9eo0oT2IF/H9/OgoWXT8o19A4578Yrrq8p76JAmZlbK3GMB6r1hG6XpF13YUTr4NgvnZAKO6OxAjmwWJPteJOfhQFBEdSCYYxEVQXpikSB5nBQ5gPQ4o4nGZugKKwpZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FC0rT3gB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FC0rT3gB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298881F000E9;
	Tue,  1 Sep 2026 00:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788221704;
	bh=lB0X/exIV6IEwCbwSwPz7Jom7PR//hg5yQfL8e8VSvM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FC0rT3gBr/AlVMLRmm2gqPS7VB3A64H0yeh2lWlXS1/cwfvqiXaeCeAeLurdUdvSk
	 +I4SJq9MwlbGEX0Hs0/5iWIq0GWE0FzgrFUs6KR8VUp2YNQYLAo6fP/gmD75NsmD+Z
	 qMthYCV9a85GOQ0ZBr2xAStDq8qpK/WrkjPjX66NBwCo+swKauqTBtKLwQtVNnyWbX
	 xz9aWZyFdIFF/T4ZCv3CxcBoY+zsbCJB/EfL9QdsjmkR3wTtt5Tq9VlDhUgaGaSJYi
	 UR4731HE1JwXKF07/DfdefvgPM6PyoSvuysaUflqsKc2O6ZNbT+Ejo7C1stj39uvl0
	 LymDvRToLGjig==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260819-kbuild-prefix-map-v1-1-f5168b96fac0@linutronix.de>
References: <20260819-kbuild-prefix-map-v1-1-f5168b96fac0@linutronix.de>
Subject: Re: [PATCH] kbuild: use prefix-map for host and user progs
Message-Id: <178822169434.4128818.4350884709032538026.b4-ty@b4>
Date: Mon, 31 Aug 2026 17:14:54 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=722; i=nathan@kernel.org;
 h=from:subject:message-id; bh=DsW320seDJszdoatKfzyA+Mn364XpRsiSvkUaA1mCTY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnTJJk2+3eqV73/mXV65tc9ZqvLV9wwt/IoflG/vi9wu
 +9fv6fBHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiZs0M/5Tv7TozzWGGx1vP
 BxZPm3YeKpz4Q93lgcSbt/ahZosY2AUZ/opzbT5rz6Dx6ZzAa731lUXlUyzuuTZKuuk/3CUTcnI
 +CycA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Wed, 19 Aug 2026 09:53:38 +0200, Thomas Weißschuh wrote:
> kbuild: use prefix-map for host and user progs

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kbuild: use prefix-map for host and user progs
      https://git.kernel.org/kbuild/c/7c1bcd3f127f3

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


