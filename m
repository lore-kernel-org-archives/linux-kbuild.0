Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78759368D46;
	Fri,  9 Oct 2026 20:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577926; cv=none; b=QF81FFg0YSBadB0hKsuWRJpZbLK4nAiezCegZynhZNCAMrkffXq9OYsjMYia/xezuhlT5v+ItuydBUGfEOncPYtrxKYn/h8MMeo/hb0XCC3M5scNIgIqbCGTLjoRh4NljBRrR6tbUTzfQuZjpeEWPPSyBPXtkQeM2RM76Fh8wpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577926; c=relaxed/simple;
	bh=UOmtAYxugkDxEIgn4JIde5BCaawipHQHa9RiIGhcbLw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aG75W5EHidaoPv6y8rG/PQi0qY6Xwct/A7DrKvsHEq3AoQJSyOb3AXEmcTXI1tc2ut3R7XJEsZPD/oA/AJPn8tnUR0XdfyFIFRS9a2eKPa8sxo1jn/7Oh6dNYqHazuZ0pbgsuh/3dMAJoA21S3jAW9b/5WA7vX1TVOAhQRvkOLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMkqaJzg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMkqaJzg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABECB1F000FF;
	Fri,  9 Oct 2026 20:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791577922;
	bh=MPpIEwswRIlRxYQ7FMP0edO8obcI9X/cAjCasyjuYEI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GMkqaJzgfJjUNt4fpej7DkeCywsFHLgobRXQr1BCT5HpqUEZ0qg/WJanXoD/GjllQ
	 cnCI3p0sz7l2NR93oTRYA4rGV12Hf9gEfZw9StSsp4tDHmCoUHSZKkuScOWk0NJsjF
	 w119A1o0HEJvS5rmM6sVDIrF39OW98CI/eMfC6XkTtYxe1Wc/SY5oMpQsgnqPzA+G0
	 ingeNSE6dHU8sUiX+7NsR9pG+p4KVfhT5G4HY3FspkAprypmlLdglF90m2uFgw8BUK
	 N+E3uevcZ1lSJYSauVDIewrrGtA/dTdUQPlAn/D8jhd0kIoIcP9G+jk62LmMOqvgw2
	 Iu5oPExeN9jNg==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, Leizhen Zhang <lzsx618@gmail.com>
Cc: julianbraha@gmail.com, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008164540.3686383-1-lzsx618@gmail.com>
References: <20261008164540.3686383-1-lzsx618@gmail.com>
Subject: Re: [PATCH v2] kconfig: use the value argument in
 sym_get_near_range_bound()
Message-Id: <179157791779.773304.13500902049943640827.b4-ty@b4>
Date: Fri, 09 Oct 2026 22:31:57 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=748; i=nathan@kernel.org;
 h=from:subject:message-id; bh=UOmtAYxugkDxEIgn4JIde5BCaawipHQHa9RiIGhcbLw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkn/e2P11l9t3Jp2aRTvSK2aYbODPtfl1e+e6rL5TC9y
 Pm4rbBWRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIZ0dGhs7FS9uX/1h+5vDh
 U2e2xJ/a9zzJMDAje+WC/Q/Zrrw59bOfkWHtwSdfrbI6osWC2z/3Z9io7rpyUdl116qLnXtlFrm
 bKTIDAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Thu, 08 Oct 2026 11:45:40 -0500, Leizhen Zhang wrote:
> kconfig: use the value argument in sym_get_near_range_bound()

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kconfig: use the value argument in sym_get_near_range_bound()
      https://git.kernel.org/kbuild/c/a8f72a75b38a1

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


