Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE8A3F8EB7;
	Fri, 25 Sep 2026 22:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790375662; cv=none; b=bZo0tFI6U8K2NyqICSXIUSzWYi2VzyDP/gnCJqttZBeOwlMmc94I0SdCRdUKGaq6Ksu9+PJBrwFfDAqgkqLooNFVxKe9YSRt5igK0/zTzSv5O1aTRKZkeV3EFRug6qwWeoewZqK+Ya8wrfBOJI9PMPgTNxrQkY59Ios0LcX8bWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790375662; c=relaxed/simple;
	bh=tX1ZUsz/e3rGKGnfkJVQfG1XgBOccNslQa8RBduFZ2A=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=U3i01fPN+0ekbjRf4f2cCjDFRCprpk+yCexEE8YSFLGYp9bRlx5yPaqdmcbaHbJ0lHfFpU6oawwUDF6BDd2qorzIYENh7qwJUPb9y4FUBGB3HeNn8q2qWP2JG8avGhElSznVo5rkkIz23sCB+5loDtTeFsZMV6IYjGsRxC/IFCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S07rFfqi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S07rFfqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8531F000FF;
	Fri, 25 Sep 2026 22:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790375661;
	bh=aITeuYia8itF4SMTQUZnXmogWzeqC/Cn61W96CfNPLs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=S07rFfqi+H+8UNNSCOjpX0krnknUgrcRQGjE4D1LGyV1XWXKQjDQwe+MY2KN+cfUw
	 ZRwvDbwvE8lSobwoDwRWk6XB2q9S/9LbXaDhf+lccJp2Tzt0UGD+gaxEWKl2uh8RqA
	 NlcmJT0p8g4+g7ZICepgQ4zrm2cKRMo/Yxw4mHmR6mPB4Cc76ZzDGqZXiQKYFUpI/g
	 NAJS8iQQTCoqban+Wrur77C0vShFn/29hG4C/TF1QLlK7OL9PAby9HiT+aePd95k2R
	 xkD4Yz/mDHGwFPQtTTcTykgdmj/CoQqIYHRoJ5OhXyon3PYvNCPOc+ZhrdWdXRvCuZ
	 a2h+jpvhv1xqA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clang-tools: Import os for broken pipe handling
From: Nathan Chancellor <nathan@kernel.org>
To: houtinghang <ue081723@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
In-Reply-To: <179017337986.52388.7943687183785012868@gmail.com>
References: <179017337986.52388.7943687183785012868@gmail.com>
Date: Fri, 25 Sep 2026 23:34:15 +0100
Message-Id: <179037565553.3985470.12035061965740287126.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2132; i=nathan@kernel.org;
 h=from:subject:message-id; bh=tX1ZUsz/e3rGKGnfkJVQfG1XgBOccNslQa8RBduFZ2A=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnbvj0vfRZrfvFE58VpKz/OOVEm92/xwUWmZW9mbv1Tv
 it94dfuHR2lLAxiXAyyYoos1Y9VjxsazjnLeOPUJJg5rEwgQxi4OAVgIodlGP7HSLx/37XY5/q1
 Ywd0Xugxvri0rW/y/BMrOQ7JCT4OXLfNiuE3q6q0cJbuHcODM9/XBf8KZK78kPaBk9d+6cPvR5b
 PlNrGCwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On 2026-09-23 22:22 +0800, houtinghang wrote:
> The BrokenPipeError handler in run-clang-tools.py calls os.open() and
> os.dup2() without importing os. When the analysis pool raises this
> exception, the handler raises NameError instead of redirecting stdout
> and exiting with status 1.
> 
> Import os and add a regression test that injects BrokenPipeError from
> Pool.map(), then checks the redirection and exit status.
> 
> Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
> Assisted-by: LLM
> Signed-off-by: houtinghang <ue081723@gmail.com>
> ---
> Testing: python scripts/clang-tools/run-clang-tools_test.py -v
> The test fails before the import with NameError and passes after it.
> Tested with Python 3.13 on Windows using exception injection; no complete
> kernel build or real clang-tidy pipeline test was performed.
> 
> AI disclosure: Codex found the missing import, wrote the fix and test,
> ran the test, reviewed the diff, and drafted this message in response to
> a request to find, fix, review and submit a Linux kernel bug.
> 
>  scripts/clang-tools/run-clang-tools.py      |  1 +
>  scripts/clang-tools/run-clang-tools_test.py | 41 +++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 scripts/clang-tools/run-clang-tools_test.py
> 
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> index e78be82..79d58b3 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -12,6 +12,7 @@ compile_commands.json.
>  import argparse
>  import json
>  import multiprocessing
> +import os
>  import subprocess
>  import sys
>  
> diff --git a/scripts/clang-tools/run-clang-tools_test.py b/scripts/clang-tools/run-clang-tools_test.py

The change to run-clang-tools.py is obviously correct but I am not sure
this test really adds much other than noise. Please drop it and resend
with an adjusted commit message. Additionally, please adjust your name
in the signoff to be a "known identity" per the Documentation.

-- 
Cheers,
Nathan

