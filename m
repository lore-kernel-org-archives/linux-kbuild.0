Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DE43C2D;
	Thu, 18 Jun 2026 03:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752741; cv=none; b=GpSueORrdegeZuYnGbHojqPtQILo8/reWrj7WK5ZscqlYEYEy9RFD/DuEv8t8WPHgrUUNW2IlWx/9bksqMt1TccKG5qhovHaiBB6OCC1hS6Bx9UzpZW0DMM4g3vZT7eWG/gImd7lWEOlZOJBafeITBSHR/McQnRmxh5hukSKQPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752741; c=relaxed/simple;
	bh=d/D782fDRDYUo/1S4v0XuxcyY52XXUtzkCyKAvlmtzA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=g235bmv5+/pX4ePmzy9RmO7zhjuOpdAk2DK2I592FzFlIy4Qs/vjuIuHHHdKuuXlRzRlr/7kANPSR/D77lL5axnVvxPdhgLlp1dYz2eYB4/HBZGNwoY200Jo3H1tG/sWncQIzvmaN0Diuw5d+Wxk2dMAxK1653rcOkBdq7pQurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0gSZnmB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0gSZnmB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0401F000E9;
	Thu, 18 Jun 2026 03:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781752740;
	bh=2KkI0Ei440DQkIVJC1lKBXdMbKhbYMxA+p5UpCwhwOQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Z0gSZnmBth1iY+9KHw9FtTAyhTU8/8tQgCjdUtwgR2AciaHM5RSxf+MOpJLcBqVU1
	 x5CJKDfK6qk47e9FFAJyWv+zRBkdh/UP0QyCAqb1SYr+916o/YXDPVHkF0WlC6B1+A
	 wxDBCEwsr2XuNA196ebQXp+lLt5xMNlLffDZEcTb29EGRsCTXcNZSGijvumg8rGcvI
	 wlH8j59+/RmNNrEGtD2Gk+bAR1PKI3TWpSLiXPAn27I31KtQElXbLRAjK9P5VEa8TM
	 a15im1lp9nHICqRurJimn8JtiNhadsMcxkX5OKLE/WDfONMp9lQfhHMjtrJoOzuxQo
	 eChGv7NFQe0bg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] docs: kbuild: remove ISDN references in Makefile
 examples
From: Nathan Chancellor <nathan@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
 Chen Pei <cp0613@linux.alibaba.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
In-Reply-To: <20260613232830.147116-1-enelsonmoore@gmail.com>
References: <20260613232830.147116-1-enelsonmoore@gmail.com>
Date: Wed, 17 Jun 2026 20:18:51 -0700
Message-Id: <178175273131.3916864.13607634190318049114.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046; i=nathan@kernel.org;
 h=from:subject:message-id; bh=d/D782fDRDYUo/1S4v0XuxcyY52XXUtzkCyKAvlmtzA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnGyYsm+k28qubjwG334fntVWWv/j7e11O9aMaGxRtXZ
 ScbTQ052FHKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAm4nOQkeFskb/D456a5kmd
 G1I3/FAMTHquOHX1znenbVN9orRPZygxMnyXCxc6eXiirXqBccqTL+sN+SuNKm9HWBne/tnJXaD
 JxQMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Sat, 13 Jun 2026 16:28:27 -0700, Ethan Nelson-Moore <enelsonmoore@gmail.com> wrote:
> Documentation/kbuild/makefiles.rst uses some extracts from now-removed
> ISDN code as examples. While they are harmless, they appeared in my
> checks for CONFIG_* symbols referenced but not defined in the kernel.
> Replace them with generic examples.

While I am fine with adjusting these examples to make it easier on tools
such as yours, how does this solve your problem? CONFIG_FOO and
CONFIG_BAR are still not defined anywhere. Are you adding exceptions for
these symbols? I ask because I would like these to be a little more
"kernel specific" if that makes sense.

Maybe it is not worth even checking Documentation/ for dead
configurations at all since that is probably not going to be a bug very
often but I guess it helps with cleaning up dead documentation?

>
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 7521cae7d56f..ec8de1c20834 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -127,11 +127,8 @@ controllers are detected, and thus your disks are renumbered.
>  
>  Example::
>  
> -  #drivers/isdn/i4l/Makefile
> -  # Makefile for the kernel ISDN subsystem and device drivers.
> -  # Each configuration option enables a list of files.

I think I would keep these comment, it is still relevant (at least to
me).

> -  obj-$(CONFIG_ISDN_I4L)         += isdn.o
> -  obj-$(CONFIG_ISDN_PPP_BSDCOMP) += isdn_bsdcomp.o
> +  obj-$(CONFIG_FOO) += foo.o
> +  obj-$(CONFIG_BAR) += bar.o

For instance, I think using a more descriptive symbol illustrates the
example a little better.

  obj-$(CONFIG_DRIVER_ONE) += driver_one.o
  obj-$(CONFIG_DRIVER_TWO) += driver_two.o

Same thing for the other examples. I just don't find these variable
names to be particularly good when illustrating actual real world
examples as opposed to conceptual ones. Not sure if others feel the same
way.

-- 
Cheers,
Nathan

