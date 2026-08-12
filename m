Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DFE4028FF;
	Wed, 12 Aug 2026 09:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526246; cv=none; b=AGeycRRdPeHJyEAe1ONnT5AUMjlYiFw56efS/EDcMLmk9510EhKIMCBmKEAVtZWCWfBAFp5AjlD2DG5Y9hh8c62B8jWoZOMexyKOpxwYAALJ/mhknksESshSZ2w5I40wd5WkpJQANZmP/QZw9eVg8U++sF7LJzsluC7oElOMqSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526246; c=relaxed/simple;
	bh=lG4XIUQoEyQzBegmAKmdIxYgkDG1FkH+wJO1/BG9EEE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ttCqY8vAf+aTspoGRk6m9ZI+k+q5ZJwAEmawaF/qEca6Es9ux3OvhUGe8sD4BTRqMHl6TpPNHwXoqrwIZIcmfCuK14vklf5gdAn5dMPLna3nMs0mr7282wGA5h+bVOc2Izy4sCLpI2PaG4nuA62QpYm9l2ZLDCEQSJm3nlpKLbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=EhKHZfAj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QCZ6XVu8; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="EhKHZfAj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QCZ6XVu8"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id AAA99EC021A;
	Wed, 12 Aug 2026 05:17:23 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 12 Aug 2026 05:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786526243;
	 x=1786612643; bh=JMHRZkTThzL4/D2z2n6orsf9ZiqWCo1mWUhOS/9wsRE=; b=
	EhKHZfAjZlk1TOyMzugGhsGEWU+sn5be0ZUg2UKDIrbY8dBBZtPOyKY4aBtRuSaH
	UHHIDtkBP2r2UveKtLpEj8iJ//MMnlgfdRPNrLv8qT510Jw01KFNAwbi1ED4pi9j
	Z5AjeI/kK1J99i1tjJ9HuF6xDXGRVGOEROeocXvSEM8Knddb2LXzLqohmD2DVPOk
	L75JdnsjpxIwMoAWDz1ksxBjHCdcFi/z26sG62JnRwhYVr8kIUgcWmQfH1S8s9ud
	LWQv32ZrjVEdKT0bDGpM3VcXK2XTBdaLyH+ARYwBM/7w1JxwvJThKZKF2sOhNYJI
	6ORzOilPT9srRmQ8KeChrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786526243; x=
	1786612643; bh=JMHRZkTThzL4/D2z2n6orsf9ZiqWCo1mWUhOS/9wsRE=; b=Q
	CZ6XVu86puHoSkjabl6Z2NRElvpCi10HTfWqxrvGbu56p2Fx9BiU8KF8PFk+DD5n
	rQUR5r6fdsesxlK9zLXQM3HpkiTvhV93ikgQLDOL7yWd2284QbPjDfjkLEbN27CN
	2gvJyPEnU9gjPTrEl+PWHvPa/TFlMl9XXqkA44fGTy61NvO9taCd0ddotWio6mKW
	zWqi5qZIKhc/0Q2f1IyhLjfRUeMdYOBdAozcqWxC6fSv54fZPrn83PqgQbTC8Sr0
	ogPoMJP2Amwml6Tc5YJWIsZD26RF9y3M8m/7MKgSWbFasXiGiWEiSnX3CLWb6IGs
	qgZwL6WT3wYjInYB8iYSQ==
X-ME-Sender: <xms:Hzp8aui9Nr_iO_jIRGI5_tjcZ8gbv0qt-a-Alvs15rVq0d0iVr7oaw>
    <xme:Hzp8ap0fXLZNLajmxLqgGr5L5cF-lpg5GLFk6o1NOTEehPAn7LegLHu6NQabU2x_6
    0VHWHeqFb5GwIxv7uZX1FcTfIjI_nQUZD__BfEg3vA-ji90q63vfHxM>
X-ME-Proxy-Cause: dmFkZTFEO3+Mv0fUlPA8/fF1P4u/45A7I749cOt0O09DdbJrIQFErCuWKjS8b8NaFx45H0
    JqucUDqvp7OD7IizGui7364FfoeWpSg3IWjeqe8KZuNFqLaBiU8JEFlVo01VPL9lvsmamd
    k+k/tWB+VCcY7iEfR67OHBmH/sjpCo8QDxG/tkuG7VopQP/MOkQtf4PZsjQPGIjsm3HOTo
    7BvjBNOqC80ufvl9vNdgp64FaWQnmDFv2h5h5JoQ+plpbIbI8eKqCtW0v1PX02JidZP23U
    IX/IZogBCW1Q34kJ0D8DMTHIu9w0rB8X0hUmFSE11T7Bmo01sKQQbQUf32KeIEEwK+mIeM
    GfripWP8ivJ5/wD/pqVIBi0cKyIx3zRQoC5n9xtwHfxTNFJ6RWa+OsBlKo9Mqu3du/IDyH
    +d00Bcj2KVX0iZfDYKAyiD6Armi7uu9tyQ0AFYmnb/DdCWy18rs9Kyv9/+YG0d3d/Yv5uu
    mFAMn8OxlycUb16cxDmu65fFWzTk+0EPA5E1ZpgMp0OH5P3iZcJDc6A5/1xmFENqrig3dL
    rzugJTKjXrs+NU/4CcWca76UkoUV1JdFbjxj4aZ1Eio2h2lh4l83rmZCKr2e2zm0WIWOfH
    TzUvwgavWf++JTWauBJ0KLXXlgEaBt0AlMcYOkl9Ke2dGrmr1CKDX9IhLOlg
X-ME-Proxy: <xmx:ITp8akLebwAkz96JK1JwmzFfbIh0mgK0zs5M5qMOqSpmVVSmJZrEGg>
    <xmx:ITp8auNNdiR8nxkwZgPBYEkG4epukzEDoue9NiRCrJpEQ3-2rPHnBQ>
    <xmx:ITp8akl3d-tla9BMPZZJnt_zpP0UVHCJ6khEJOe_WPQy3HIDRYNLlg>
    <xmx:ITp8ai5bvmrPGRfg7nJ6Bk4-pT-MYBQOc4gr2Xe18M2nQl_X5tvEDA>
    <xmx:Izp8aqbP035RSb0iq8Zqh6fFGpuFXfOjfbbxf92PMCbl-t8qg26vzVJF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6719E32A006E; Wed, 12 Aug 2026 05:17:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8cq6fax0o8Z
Date: Wed, 12 Aug 2026 11:16:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 kernel-dev@igalia.com
Message-Id: <ca0326a0-ce13-4bfc-b36c-5612d73335fa@app.fastmail.com>
In-Reply-To: <20260812-tonyk-syscall_table-v4-8-748d0229ad40@igalia.com>
References: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
 <20260812-tonyk-syscall_table-v4-8-748d0229ad40@igalia.com>
Subject: Re: [PATCH v4 08/12] mips: Get rid of custom mips ABIs for syscall tables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026, at 05:33, Andr=C3=A9 Almeida wrote:
> Get rid of the mips exclusive ABIs for the syscall tables and replace =
them
> with the common ABI names, replacing n32 and o32 with 32 and n64 with =
64.
>
> No functional change happens, but it simplifies and helps to unify the
> tables.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

I had expected you to use 'common' instead of '32' and '64' here. Since =
you
did not combine the n32/n64 tables, this makes no practical difference,
but it still makes the tables look different from all the other ones, and
it means that the following patch to unify the tables is harder to
validate since the inputs are still not line-identical.

Is there some reason you went with this approach?

     Arnd
