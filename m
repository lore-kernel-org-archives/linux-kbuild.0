Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9CE254B03;
	Fri, 24 Jul 2026 05:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784869982; cv=none; b=h1GVzvJQDOzxYcwZYA+z9qSCAYDolef0RBH6/BzMtW27w85KjRC4uZUfwqZ+rK9A88mWo5GET7T5oqdsW47Joi5u9qlZ5h8m/90kB2dSivixtf7UoqSql74PLJPlUrtWm//rIgGG1zVfWIQpfFgiPtZLPgb92rbZcMfTd0BAxrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784869982; c=relaxed/simple;
	bh=2Opi6ydBH20RwNEDfM5dlMwEbUj4aba/tUpAUfMKpj0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZxLGD9DAhGj3gQdGbditZBRJ9mqVEYSHM3wKk1YOnazVv/UyS8kukRk1Ofgq59G4seae8Z3TVPcsgcwOwM8dmkv9WEDvkWyuOZa2QYblpwRya0IsZMX/tKUsLayTDJ6bh/JfRhKt//C2G3i77YKRwT3fiIqMb6dNSKmkq1ku8WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6KPqz75; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6KPqz75"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D57591F000E9;
	Fri, 24 Jul 2026 05:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784869981;
	bh=YYZ1eJMD9M25QQed3wbx3rRk4lzC3vqT40+IpX+lUZE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=a6KPqz759S3l+D4xzzzpnXsXgf0idkzO7tow8JoNhh1WLYoFjLg5tHoLCdnyIUe7Y
	 z9stMfVxtS74lSZYvDHqtYp9WHRvo4Sj/9sP7WvvMr8JG2QCHHeFMPR4hkWNjWkbRB
	 uzVT1wA4hcorjCTPa0tLW3aDda5/nbWlSJhOPqs9NaX3iSSyZOt4aDiwtqLBbcRgVe
	 xR2lVUt7ybdTs+vvl/C3gqAX2tGQ0IMeRc/a0w2MNv+zdWl8kC5UrAGhNTfYoTT2I4
	 vGK+r8Hu8Qgpt2CxVn9Pw7jLG8u48GiAZgTg3/t9l/9RTe6JEKHGw4hY8TFI/CmTZN
	 2wf44WLMQ5VcA==
From: Nicolas Schier <nsc@kernel.org>
To: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Thomas Huth <thuth@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Huang <sef1548@gmail.com>, 
 linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20260722072928.24500-1-thuth@redhat.com>
References: <20260722072928.24500-1-thuth@redhat.com>
Subject: Re: [PATCH v2] scripts: headers_install.sh: Normalize __ASSEMBLY__
 to __ASSEMBLER__
Message-Id: <178486942643.1793472.12072264488475701058.b4-ty@b4>
Date: Fri, 24 Jul 2026 07:03:46 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-5acee
X-Developer-Signature: v=1; a=openpgp-sha256; l=984; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=2Opi6ydBH20RwNEDfM5dlMwEbUj4aba/tUpAUfMKpj0=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqYvKqysZO8sT46OvNJfe17KGv2dx2GfzMunhzZ
 6lVxMiuFdCJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCamLyqgAKCRAHUgpwFiYS
 aR20EADMd0MsAmj9i0waqfQkoFdkv+vM7mmBbJbIJLYALw1CegM+MHVwoOf5koraJm7mWNioddF
 e5QREtEPH4xjW919GttBvBRbaD5ZAjXhzxzutMSAc/KJKtwou4s4Bp26qZQ9fE3KWZ1DWJWJ3Ob
 +L7jPLHNUN9uuCxVHtKUNVYRPAtA9zlKtOkP4Qa4NKBdZpRR70JH/wHSLcAYZTGr+g9vWF/a/kT
 Mr7nNL2MwEURj3hcwP5Sxc5Xc9qh0v2VT+hbCjd4luuTdRvRG2e7TllK66wD9/DyRFegTzZpfz2
 FrS2fSulufu9BpBKzXW+ALRbpbazAFbfX9iiPSFAq9CN77bRdK99997c54JTqDT0Q5XZY9YsnDC
 70GDHYofVryPATXW5W/nH3p/UpqiVJB6130QBeRgs6OrNLY+Pcd56jVuhibgtm6GJpOvIjcMCbs
 hoeCN2qPAHLdmBDiBAIzdySVY2kkcCWGSWKJfSDaNdbb2KdQcO48gYetIdDbZSpvsFkAapSMxXQ
 fkJX4tF39xeHTezXEZJscB+Zd9qsKKlGxgXGam/Vk2TulhA0d52SHtEnO3tUH0bVlOM4lmP9OEM
 qCDfn6ZEXgBid0V2nj2FMUKFi3Nd3gA0DJiomzq5PCtgRQe4EHhP32T12vYKSOkafyUKQaepX6W
 iEWoRt0VKOnjKdQ==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Wed, 22 Jul 2026 09:29:28 +0200, Thomas Huth wrote:
> scripts: headers_install.sh: Normalize __ASSEMBLY__ to __ASSEMBLER__

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

I apply this early to kbuild-next-unstable for that we have it in
linux-next.  I am still happy to apply trailers for at least a week,
maybe longer.  If there is (still) an issue with the commit message,
please call out.



[1/1] scripts: headers_install.sh: Normalize __ASSEMBLY__ to __ASSEMBLER__
      https://git.kernel.org/kbuild/c/77e9bd85

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas


