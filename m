Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042771CAA92;
	Sun, 11 Oct 2026 00:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791678266; cv=none; b=ev8ehXgjn9hXvybLggTFzKjXq+pdUWVpzWJ6hgnJ4KYXPu83Im8LL2yumDuomCDQ63a6jhU2ZkeZOVS+5dELtZDq16lsJaCQERj0vOYurZ+H4dv2/H1IMzYIo19c/mRjnhbBOrWUvyu4CC1/EeY5wYkBhs2OQsSNKZ75tAH7J9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791678266; c=relaxed/simple;
	bh=mw4uDn52psPQsowKgfyz+H3m8s6P5wAgGu5dxdM98rM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q+VJEJx3KHTiaZc3gPrgMCj3NAHu9cQkOGHLwBRTiTjcw0oUOm/QjWCvEGVJTbHha6izhWw7NhqwS6F4aLWEbtYKa1bwySVyzxdwh8n2iWj8gIGEovUjmXUHJ58g7gNIhFqpksmXq0EG7uU0ADxLzWpIo7DbmbpWa48NyGmSsfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOeziGOy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOeziGOy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA591F000FF;
	Sun, 11 Oct 2026 00:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791678265;
	bh=e7SOl3meJKE0sc3cqt4qHuCQKfxeRpyWzCx1C/zFW+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iOeziGOy0tYXHnf5F9Uoa5MgXNaWwZOnOqW8+XOOl9selsG5FahEcgNkr/DEr8OTb
	 cc5OQXp5pL72XNl9RKXpNMBzQOKOpNNKMUSi9GYc4qLD6WzxEgh/O0zZdZhLuDceV3
	 FOaiQJkYsmVFEm843tPEeump6BqM8/cQOTu81V0TdKHxB5Kou6f53YGS65vU9GUAw2
	 9upiNof54eyGgXJmCN/GNBru/5LKn9lvihD9nWGTJ4FEitxPYN30xKLCH8wBC2GKpX
	 44PQB5+MghPQhLapgEg98S7R7S79+oipJN1KM6IGcpr0NRjNGOiWYjskRwkEZijbNg
	 +WZgvwW0VAxlg==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, Aaron Tomlin <atomlin@atomlin.com>
Cc: julianbraha@gmail.com, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925181230.130525-1-atomlin@atomlin.com>
References: <20260925181230.130525-1-atomlin@atomlin.com>
Subject: Re: [PATCH] localmodconfig: Explicitly report boolean configs
 during integrity check
Message-Id: <179167825661.3510825.17086446256659768522.b4-ty@b4>
Date: Sun, 11 Oct 2026 01:24:16 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=769; i=nathan@kernel.org;
 h=from:subject:message-id; bh=mw4uDn52psPQsowKgfyz+H3m8s6P5wAgGu5dxdM98rM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmnrhvbSWmo9Lw/VTmzdobw8QurKndv83V45ePMK/1vS
 1No0b5bHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiGQIM/0Pzf3uobuo90/zQ
 3Kn0w+SnodV1R0OetOicPavL2eo5x5Dhv5fht60iNr/bRcsqvgY0nt/1PFlivsRWv423w2QPaQc
 84gEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Fri, 25 Sep 2026 14:12:30 -0400, Aaron Tomlin wrote:
> localmodconfig: Explicitly report boolean configs during integrity check

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] localmodconfig: Explicitly report boolean configs during integrity check
      https://git.kernel.org/kbuild/c/46d4ccf3b6213

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


