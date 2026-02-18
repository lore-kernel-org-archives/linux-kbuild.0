Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7B1E8320;
	Wed, 18 Feb 2026 20:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447741; cv=none; b=sGBp4vZqfjYtdTqyrTTb6SQXCn41fqeJBLnK/87kIO6Mw4u/GjZ3Fog31O9nUQB4sJaJs8AgwrPa58d1tnncPDRoNmGGzgpqAjyD8eNiZ04AJwJ73cWBvZAk+DXzFh8jvkzxMYGa7AxnwfCHfnJk1mrN7R2c0V99q/GaQFoOeh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447741; c=relaxed/simple;
	bh=lbYfIBnmrnEFV7yelrf0h4WGBAGd3eyGfhL/lrbRAzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rr5LqNWur6MZDrKrAdkG+1dhZsFsDkR/hOLHLAr0CUHU1vhPcb1toehF1jfyIrUmCqojovtzaK/A+FoBrvIy2ALo2+Oq5eupgyMO7vfGHMHJsL3K1s+GatIubWJHRI1YfBOnnThBLANFeNG2VFJMK3FoYxIgkcRxAcediQyeT0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkI94K/j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkI94K/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43574C116D0;
	Wed, 18 Feb 2026 20:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771447741;
	bh=lbYfIBnmrnEFV7yelrf0h4WGBAGd3eyGfhL/lrbRAzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XkI94K/jYhyRQI4XGgeXdB7Ey+V6LaYpNEfIkYWXi+h1v9UktR9CybCR0A1n4aIYQ
	 exrx9n7TAaOtZmS5u9O8UJPOr/a7XxCLPr6TXGJMcJ5CTbPYQJnb70aLIwWqg2eE+i
	 p1M2wZeabzE020zoKDxzzGyUH38G6HeNThf69nUWZ0V73eNMGPuCF5/fC+ttKPkFQZ
	 0Y0sQJAemqXt0CaDfNWQokLbWkmC47iTGzFBX3ouMk8zd0VBqIDLK3e7fzp6dRBSTi
	 6vP6jrMaY5GBJpQGVXyuoEW1WpnOrfmBa9TpaW2LyzyKPQ4r2+WuQzcMxjrSVCG9kx
	 94It86s9YebeQ==
From: Nathan Chancellor <nathan@kernel.org>
To: x86@kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, Jens Remus <jremus@linux.ibm.com>
In-Reply-To: <968faf2ed30fa8b3519f79f01a1ecfe7929553e5.1770759919.git.jpoimboe@kernel.org>
References: <968faf2ed30fa8b3519f79f01a1ecfe7929553e5.1770759919.git.jpoimboe@kernel.org>
Subject: Re: [PATCH] kbuild: Add objtool to top-level clean target
Message-Id: <177144773899.1769768.18400840674852001978.b4-ty@kernel.org>
Date: Wed, 18 Feb 2026 13:48:58 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Tue, 10 Feb 2026 13:45:22 -0800, Josh Poimboeuf wrote:
> Objtool is an integral part of the build, make sure it gets cleaned by
> "make clean" and "make mrproper".
> 
> 

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] kbuild: Add objtool to top-level clean target
      https://git.kernel.org/kbuild/c/68b4fe32d7378

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

