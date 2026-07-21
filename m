Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC933B27C7;
	Tue, 21 Jul 2026 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644268; cv=none; b=sbFYboljbK1dF/69IjA1oa5Qs7uDa0PiuJyDN7USOGjwui2QS3Ee2XQcWhlotFv2UpP8E+iZcMFiktPgPu2x1jrWUJYkUbVWI/zllWoANvxMIQCclYw9gbj3FqJu5799VtxeH0p7k56CAy4Wch1gsnnnvlIcuxFBAT40nluvjc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644268; c=relaxed/simple;
	bh=L+yupFsH+Op5IxoHE8zLXI60QIOpa6SP56mCEIPpys0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PAp7I4qXRwzMb78XzejbfunjjEYwcGT8kD4iPlzERNjw1KnY7QTCsjhrPzHjZBiFXBFwUjcEG29mXcjhlwS9AqzCJqKW4KiD08XchgCDSjosQy+azK0aX8S+cUFNoODfUFX5eX7bCM28boPQB7Q9yUjLUUFjCgIBbSYsOLm8f6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tg2GBQIu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tg2GBQIu"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BE1431F000E9;
	Tue, 21 Jul 2026 14:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784644267;
	bh=XUwxaNNO+umtBmadm93D8hyxppzEAPQjD3J+qEgQn4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Tg2GBQIuLiBwhiCq/Yl3iZFw7U4rCwDRz9KtjpV3FjUXbd4bccXjafNs0GhuozUi5
	 MklAjrskBwzWblP4y4gWNyyVaDea/ezLrJLtpzvuFVnitu0xdiCSAkvrGvYWytGTgy
	 YyOU62YGc8vLMhRow7E9O+lRnvrHOQJOB4WPYYJITF9oOKUcjKep8i18zs1kKu0zQi
	 rkTKWlHi13ucvtn/0RkAkJ7rBKIFpbK/tnnojkTOQhucA3K+Z7nv7bibJHhp7WU8uW
	 zQbKpCjiDpcNFrDs2FocYaTmGNlIw9mI2CAUuhULhkP7m58DC4jxg8f6WqMrXvbuvl
	 fEm7i63DWguuQ==
From: Nicolas Schier <nsc@kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Yuntao Wang <yuntao.wang@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
In-Reply-To: <20260718040146.294700-1-yuntao.wang@linux.dev>
References: <20260718040146.294700-1-yuntao.wang@linux.dev>
Subject: Re: [PATCH] kbuild: set the initial value of subdir-rustflags-y
Message-Id: <178463122223.1439086.3596322964446838792.b4-ty@b4>
Date: Tue, 21 Jul 2026 12:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=719; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=L+yupFsH+Op5IxoHE8zLXI60QIOpa6SP56mCEIPpys0=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqX0/CZVs3QmMVAh9PWNTTjDY+FrCtG4DzXCvof
 xNUpruDOqOJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCal9PwgAKCRAHUgpwFiYS
 aRUQEADTkU9Kktts5aKVUcXUj0MX3GxdurAn2i2hPvWGhEKzPVjS5SHYqoyJrIBqX8fggmvisyD
 kQm/3LH66rm4pHoluHtmGWkoyisL5WjNKBBNyM9jf406S55/rA3Q1ecejWZNjA/vmpaqKOzV5Qk
 mCGyAaOnVXtbqEpnV/Mx36ZWxVm3PUoPnqLR08qBtI77HoX4vqldME8wPLHYbD4OKkDC6Jlof8E
 wgYPmRNK5tCUxQsGsZv7iAyMEHXssM8nEh7WUC4ftafsbaHmmtOW8TyxvsWPGY9YHPR4tNUfzzW
 I59+E18qTG+YRsnVZ17dFZ1UwkpXxVFZRdO/XI5PtD7Ygm7ssyxFzEbA+iIZkfHcD7m7uXKz6st
 s7nT6r/uulXi3KZs02J4h6az9zMP2ngSpCuXYM7wHXfJx5mELKjtV+N3PokF/ZIJXomuYRHV2oq
 y/6v1cROrcpKrI4sBWOENwB96mMSHjYfMnW8zOcO96N5HfP8qCKrUI0BRepdxWIO06EhquBuEPI
 QhQphGH2khRjdX9CE88TSnLh7JNfU8S3fJm4+5eM4f9OPjcG1Pn/XVctjIm8eoCDKJqjKnBicoc
 lyWc4BDhXFf9lqrBUhPSXcqIlK0Vmo3TIFsmhRGLB8vgOLx6Kfqt/oH2F8qSf8RL5XxybgUVinC
 4sxrDR7xOm/hdWg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Sat, 18 Jul 2026 12:01:46 +0800, Yuntao Wang wrote:
> kbuild: set the initial value of subdir-rustflags-y

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kbuild: set the initial value of subdir-rustflags-y
      https://git.kernel.org/kbuild/c/2c5a2273

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


