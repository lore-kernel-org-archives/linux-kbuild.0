Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D393093CB;
	Sun,  4 Oct 2026 16:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131112; cv=none; b=ZJI2bpg0D0M9XNyjBFAv0tzoKS35ot79Z7wgYNEdyzGvNt0cpl7W9/ooOXOcA5HFeO4Z3vtBndg9ZaXXhh8WLfK3uKAHCJaZevdJbZnbSx61JCexw1bfT4mXWr8tWK065xJQaWICKSSqMODJk9t0r4HfxbH1CCB9vF9LUXXT3bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131112; c=relaxed/simple;
	bh=A0A308EdeHLu88ZQzwsn4h2IZyDIsf/gdy22KqCs7ZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V6okGjqcz31QPfeev66uBmEJelDM/o45nWbbv0aGYhGM64fP48K9M02AMQigfuPtjvTZ+lYfykuv0B/7/eZinuI55158R3juxrUO5qObailh9KKDVTAC5yEi43F/L9GsGmID6CEt7FnICwsjMow1DWYlWONRPD0+2YjSKRN8Cq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPTIClK+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPTIClK+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC761F000FF;
	Sun,  4 Oct 2026 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791131111;
	bh=TJPje5ZRW44YslVPDyTMaKC+U5ZmdhRx2lgAphfh3IQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YPTIClK+5ux6QZOT1NXME4qy/d3zGW2zhJnksrdgr4idkx9lw8ZFbmLNs6R/L4zHt
	 iCbfI2ZSgi+qLX2EdIEXhY2LhjTXG4bra1J+pPmAhRsHJEmUOm34F+Y7O7xt8RbAR5
	 wObqNJ8xOcTo2/ZGUZZ0yI6oqvyJ2BqcCDIXoarTh0N+GquF9ZdUIrIXzj+058Mv/1
	 /Wys4COnzQ927VbHnIqyl8Bz7CBrvJjaE1Qzuykf56IyVzR79C0fAP6AbELl0Qg2cx
	 A0rw1EI2E48DbUiUsIej+a6l0I7pFA2JOq5JUc645QWyKMaqqyfo0CHalWcpf0PR0J
	 IGSXEPdi7pa8Q==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, Jan Stancek <jstancek@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <8cbe913b9f80dc6fea73a9e3d51429db2b38905f.1790838401.git.jstancek@redhat.com>
References: <8cbe913b9f80dc6fea73a9e3d51429db2b38905f.1790838401.git.jstancek@redhat.com>
Subject: Re: [PATCH] .gitignore: drop Module.markers
Message-Id: <179113110514.1398860.18288939011236251563.b4-ty@b4>
Date: Sun, 04 Oct 2026 18:25:05 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=686; i=nathan@kernel.org;
 h=from:subject:message-id; bh=A0A308EdeHLu88ZQzwsn4h2IZyDIsf/gdy22KqCs7ZQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmHah8nTKhfe3r9hbMWqhOu1oTUaPMq7n1XxL5fZOX0j
 S8d33MrdpSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJBHQw/FPccPaHes+voqee
 3+3elql8+71N38su+XLmVtmFi1otE5kYGX7eVdN72a5+U21+t71h2qT7z/Nc5vJJbPSfvc3/dMH
 vTC4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Thu, 01 Oct 2026 09:11:10 +0200, Jan Stancek wrote:
> .gitignore: drop Module.markers

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] .gitignore: drop Module.markers
      https://git.kernel.org/kbuild/c/a7d32fa14bc74

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


