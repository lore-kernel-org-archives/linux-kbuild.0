Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2309B36E49B;
	Thu, 17 Sep 2026 23:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688949; cv=none; b=W7mJhuKEUo1PziyxvD6p/m6PRiHjk/QBjB+sk43GXjNEYCSsVcYNR9gKcpUwDeXeUD0x5PbPm0RUEel3bmc5SVQlDFkphwa+SaJvJckYNDRLlXTSi9s6igg8So6TFhlVvlacCfBE7HGpqLeVtJ1VmOPfQduTy7Vxsjv5f5CwL2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688949; c=relaxed/simple;
	bh=6y9NP2Hc5h9nHAxf37vTqgzOfpWXkxVVMKuBvwoMG78=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dmeh9w7+7dX2N0QuY2fRZIDov/BM1/8oUgyQsjnNz/NsUTq9VZ9yKbTcXzU0svm2ete8FD8oiBd6Kj2FZbWmJBRXQdXhVMGj7uRdBa9MIYFggAF8+cRQvjh+7keC4A4/At38X8NfRHl+dk+SvUqivlObVJyOAyCGYhpF+p5fsXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYnYQYLq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYnYQYLq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DAF1F000FF;
	Thu, 17 Sep 2026 23:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789688947;
	bh=6xuW47Mg9d/Fxt7SaeJZiMqb2qyV/EnwB+5hj4AGmJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SYnYQYLqZlcs3KUXDi/50vjiFH7nPpk3wY1Cl2MDpsi1gvynRC4e+cUqVOA/QCYUl
	 O/g5dAAc1SQ1SHkI/bYYxspP6V/l+30VhnBD+w465UoQdOlMOs/8ylz0yETGj9AiYr
	 5k4FVkUpX4Ck3JEXwqeBqG+A5n0/TOt6wo4PqL8JVB/I6DasBTjz88JQWrpTtxg4W/
	 fTET5avNJD4PsmUjDAxmCY7bCuVu6fBdpzlQGwkNr34/j3gjUgSkbOj6Ur2vXEK7gn
	 uS5umQDhC5E9o/nn70ThO+tAfnGYtxRCVoV07VTCMoxg+FmcDULpS1Ilay9cyyoedn
	 fQAM1ecdrMQNA==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, Julian Braha <julianbraha@gmail.com>
Cc: nico@fluxnic.net, rdunlap@infradead.org, grahamr@qti.qualcomm.com, 
 kees@kernel.org, pengpeng@iscas.ac.cn, vegard.nossum@oracle.com, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <20260915211508.291790-1-julianbraha@gmail.com>
References: <20260915211508.291790-1-julianbraha@gmail.com>
Subject: Re: [PATCH v2 0/5] kconfig: improve input validation for numeric
 options
Message-Id: <178968893617.1576026.13723850141650350673.b4-ty@b4>
Date: Thu, 17 Sep 2026 16:48:56 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377; i=nathan@kernel.org;
 h=from:subject:message-id; bh=6y9NP2Hc5h9nHAxf37vTqgzOfpWXkxVVMKuBvwoMG78=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlranKFZKwb9tiv0ry2bkVctOXJ6wm+LJslmusnXEuP5
 eZ6cMCxo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzE7jLDPzsenZanS1mORL7J
 6d5k7lXoJXHhRhyzyT8Gr4ye73OZvRgZbhvwWzaxWc1fvs7n/ZzrLbW39myYvNr+Zevh9K++uy8
 IMQAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Tue, 15 Sep 2026 22:15:03 +0100, Julian Braha wrote:
> kconfig: improve input validation for numeric options
> 
> This series improves checks for invalid values of 'int' and 'hex' config
> options in the Kconfig interpreter.
> 
> Tests are added for all new warnings and errors.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/5] kconfig: promote invalid numeric reference from warning to error
      https://git.kernel.org/kbuild/c/95fde4bcc0b7c
[2/5] kconfig: check for out-of-bounds numeric constants
      https://git.kernel.org/kbuild/c/a5e84d6f6df1f
[3/5] kconfig: check for hex and int mismatches
      https://git.kernel.org/kbuild/c/d13bad83d89d1
[4/5] kconfig: prevent out-of-bounds user input for numeric options
      https://git.kernel.org/kbuild/c/54f11924e4854
[5/5] kconfig: use unsigned integers for hex range checks
      https://git.kernel.org/kbuild/c/9b8719973ee2c

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


