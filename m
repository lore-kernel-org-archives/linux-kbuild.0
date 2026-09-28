Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CD82D9ECA;
	Mon, 28 Sep 2026 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598659; cv=none; b=SuRXbCcTeFnufV4ZMv29iBSgg+h5DEaL3yVtQA+v1SGyAuCyfmROZmqe/IkTUrlUlbHvQXRHsuIEtnemjo4mMvFDUA1fcYJom20GfAZ5QE39/ZGJMOVYUhIyEQ5lhfpJuxQaRssCf1IPaNfQnC1XENkHA1on0t6b2rECIbZ8eaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598659; c=relaxed/simple;
	bh=UspbK79ZrDnlzurBUJblFBCImZpdlH9jb3l351lq6Zc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=BdVhsq3f+RgtVG8TXARIhmm5t/Bcxs72mLahwNzGXbFveohdPr4jRNbTqhcfaYfMbDgWCAalEx4bRvVej1vV00V0M+0USp9bvSyYXfU/O20MDXUgDRxKuA4gcUzBiXnSgJoTkxZzeLb5E/rsCZwhBcKs3B1H7kru1SKdyLArETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=YTovscZz; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="YTovscZz"
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED2173ED38;
	Mon, 28 Sep 2026 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1790598649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/X6QxdDlasjO5L6nMVQkbCnDx+TKI3FCWfmLJyhaqZY=;
	b=YTovscZz3nIdHgSeTh6ikRtYde6VUgBRSP6OUa/sTH8Q3Jsd/+mJjycbXhuDsROdeTyiHk
	zckl6MB0G1hMhl9ZZ5HQG0HJYTFksJudSsP2k2k53hy0OSjapbmKg4w3J/vombMA+wYztI
	izLj4syx8ndRd0PsVxi3i9ZQW7rBFU3avmTVXqCwqO5ZiyYxcN7wkPYdTl0gqyNTJUzBlh
	BWkfRWCCruELxjLb36qf/rlLaBYBb+0SgW0IUdTrtZwI3lykJ09SYrbWtJ5CDXcT35rywg
	6MxO5LwStouZuLrBpvucka0WwYnAgByXiUUDwKUBJUYq8W4RIHJIS/+iKop55w==
Message-ID: <01a87de4-8de5-4ff0-941b-2e5932a3a19c@gtucker.io>
Date: Mon, 28 Sep 2026 14:30:48 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Guillaume Tucker <gtucker@gtucker.io>
Subject: kernel.org container images
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
 linux-kbuild@vger.kernel.org
Content-Language: en-GB
Organization: gtucker.io
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTGKmUmgtVQRcj7IUYnHX6kFHXa7thUMHyHxf/olt/U/nOIPMldRXl6krmAFWxc8O89pLYT1iMZkGpKhiQsjF/y6ILxVtMcINmDIknWyRdpLPTFKPt44PlJsVCyE4v2m9Mk6wfI3yEE3gMw1uehUFiXe7PzrMzTcFiOp44s85Te6IJGpbrhEVPE8fA+ORdvzLCs7FmdWriNwJKPHNWsfjI9GB3MsEkf5NaI1X7DuA8geMZllzdWmuyehJMwWDgcEcEuy/i95TRvkqqOwBQjFdCK0eHULFCiOkNl7nEVIMwkMQskZOkBGgswIUBxP8QWen20j8crB+T0kq2MtUG+64T0pnceHh4NLugQZ50naWp9VhkMzlebpQfw8F23m8iuVrU33aAiiQb16/pLiq2CayX2nGHZsNKix9rsjvsxtIifYd8seVKYYKrRpnEvjt41Gor3gjigaJZ0VzOPHWNH2Ck+Ld5Od2lwTDCuT6ckQt9i4Z5c7iPDMAUDfxrNMxGVd+YNJ68aDOcknJzqyA23lIwBSApgNWm9/qa6/ylkufv1S+olbML6Zlmoqx8FBmqYidTDVyVV2TiY3lFLOJsh2PaOist4tR8KCC6gPmNR5EkDtrgLivyNNoaIdF28rlwTOQmw+eX1jRFlrAJrR1bGB+BWp+/1cJutOfR7RLpQCorJEMw

Hello,

We discussed the topic of managing container images on kernel.org
again at Kernel Recipes last week with Konstantin and Arnd.  The
idea is to provide a set of reference images with kernel.org
toolchains which developers could use via the scripts/container
tool.  They would provide a common denominator to facilitate
development and reproducibility.  These images would of course not
be tied to any single tool and could provide a basis for CI bots
such as KernelCI or tuxmake.

The consensus so far is that it is a good initiative so we've
agreed to start setting things up with these new components:

* Repository on git.kernel.org e.g. utils/container-images with
  Containerfiles, build scripts and documentation

* Registry to host images e.g. registry.kernel.org with quotas and
  public pulls

The repository could be a replacement for the korg-containers[1]
project I started initially and I would be available to spend some
time maintaining it if needed.

One topic Konstantin brought up is that the registry would need to
have an allocated storage budget.  We could then decide which
images are the most important ones to host within it.  The current
ones based on Debian are about 1GB each, which could probably be
optimized.  I guess we might start with a 10GiB pilot, then 25GiB
should be the bare minimum for real-world usage and 100GiB would
give us some headroom.  The other topic is authentication for
publishing images, I'll let Konstantin chime in on this one as it's
entirely a kernel.org security issue.

I believe Nathan and Miguel were also onboard as per previous
discussions[2] so it seems like we have enough momentum now and a
clear path forward.

Best wishes,
Guillaume

[1] https://gitlab.com/gtucker/korg-containers
[2] https://lore.kernel.org/all/cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io/
