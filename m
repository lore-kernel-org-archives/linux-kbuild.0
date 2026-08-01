Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CE63C8C77;
	Sat,  1 Aug 2026 20:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785614767; cv=none; b=ldPd6j2rozBdz9DMcKyh1KY1p3VSaHCCiI33/gQsYc9vI55ExwNpD+MCIpSlYElieJ2E+KKzbiDbEBj8sFkHQ7a0dDpT66cutUhVTn1mZStN8GsV8RwjGxDU8V/vazXlmUn8VQ2byRQAduc2NtCb2EYjBTgBseVao02E7wkeiZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785614767; c=relaxed/simple;
	bh=qtPaFZSEqEwBIXL9aJzonQGfEqiYUPDBfGvQke8jXXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ebANY4qLD8+ng8Gw70N5VsjJNB6OM/JUier5TxPOnKqBwso7wvYkONWjfGzOu2Ms6C2tCh5irpNOMrZmQ70kd/Q+jK5eRf5oZetCE97MAofDrRJV0PjVDvwN81J9CmqPSeNfAa83ds/amGWBFEf/gUzW2No1w2D7WnjKBJmWgqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJIlL19f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJIlL19f"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B4C9A1F00AC4;
	Sat,  1 Aug 2026 20:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785614766;
	bh=1z9cMPzKbjEgDq+iKrdcXiEF2ZO9llGh/nbLbApC4rE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FJIlL19f96jHWnm2KnpZq6PBC1HJ4LTjXjpqfuWSSdvFGm/Rd2+7OhPP6bf41PLzq
	 2NYjrenXKAZvzog7CmPbz0SpZSY6e+kfIESc389JIYbscBDdcANtswg0a3GoU31nkD
	 wU6zqbWWClYe8GWhvEtG+UfyGt6FtlD29GIf+UE0xEjRcU0L3V4Ir5ypOZt2YGe1uN
	 3iQVL0znRtbvvqEwt8kXnzT5+2JrSg4Y1Py3ByZgQJOpe2x3cPtcJi3BzrICOC9iOP
	 YRbBLRaq8e6vW/SbOL3ORgtmqfpH3SOTxHUBoG7EL12SauycRZtKnD4469+2APtbbn
	 2Q9bQvwvvhGLQ==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH V2] usr: Correct a spelling by changing a letter
Date: Sat,  1 Aug 2026 21:50:10 +0200
Message-ID: <178561376738.3102982.5583483956873568015.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731221556.3638651-2-unixbhaskar@gmail.com>
References: <20260731221556.3638651-2-unixbhaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 01 Aug 2026 03:42:11 +0530, Bhaskar Chowdhury wrote:
> s/dit/did/
> 
> cc:rdunlap@infradead.org

Removed the stray 'cc:' but added Randy's Acked-by and applied to
kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] usr: Correct a spelling by changing a letter
      https://git.kernel.org/kbuild/c/4b842947

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

