Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744515;
	b=GdbzIdf+eW3sLJz1zGrdgt37UrzndvtbRZ2iPz0YoT4aE786pztDj5WnyZHH/Fu9lodI
	 Wgu4Q+/cXr6KbRs8/bwne8gCzbGqUem2wsmYQU9jvUS2dgkky/sXVF1JJtjgI1xEjVinc
	 hnx65RJL0P7kGVq7woYRhq2i8IttrYf+VxrizUbGZoWZ6fqXwAIqdDfibFpFYH+x5hnwJ
	 mSN/8f/M5llIfyqRZDYja3oHpmCvQXHDO7k/ypsbAFRRt2VDMfz6Zn9cZOB38L8ruaVd2
	 nkR6Tmziht4MKa6rhdf/AYtkadhL9dizj/B9F81C8sxejNujkPEn1Fk8p3m5riBx28A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744515;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZzxQ8pRvMhmWdvsmwyUBbHU6F1haB6n94dmB2kelQk4=;
	b=xC4lMZHW/6qpnRaEkaw+9GdQot31cmIMgDS2IWOwIeCRbVlBRtT7OP18HiPr+5xKE+I+
	 kfipBelhjgsk4N8nnwUgLBHeEo2N1hgdIsocxEwMd7pUB2pfaJZx9QGv+wK/zsS1XNeus
	 7RehF4tsqBI8IBzfPxQ6IJ39JgAuzXbue65CWdquggWDt7+KzxTCyHXqe2KAtz9NMX0x6
	 cvxoNhbmwc4lsP5q/uoy9ZUSL4Cu9Oe9pW5limONGfs0v5DzJsTqJZRfalWvhejQS2Zc2
	 QbQxKfdMdjbrtWiuYKodq4p6zWDdDgXYsKOvUD5Ao2HbzJnRx1UkFwn9IeMH3jPZ1Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b="ufp/Fplb";
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284EC606A324
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 22:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 284EC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ufp/Fplb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793744512; x=1794003712;
	bh=ZzxQ8pRvMhmWdvsmwyUBbHU6F1haB6n94dmB2kelQk4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ufp/FplbrkGzzwlJnsZCvnBUlEOzMG91hgs+UvmlJwQLvI41qEPOkKyGRCm8xe0T9
	 qmTpwhPJ4PSTjt1wK+b8iSXbHDoFMHJk4DdwotYI22zq/AfF5WMksJnSZ3l+I2Tbl0
	 LLVJp+vGmSCd2/EowphDFM/KzhKIBGsdv5276CBO9j1Jk2DwlL4YQW0VYIotYEK9Vu
	 kZTHasu1iPtnJe6aGYaZO4z1IFInv0ytI8xUQi1a9gztDv3wfq0FdpXIGl2YdckGqa
	 gBQVU1jsQhl4cC+hW4iZNb72+/En2VUxDWsg3l6guZQcgh+JA50/QQO7M0ZhecBsPy
	 WmxLkiRp5B2ng==
Date: Tue, 03 Nov 2026 22:21:46 +0000
To: Nicolas Schier <nsc@kernel.org>
From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
Cc: nathan@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: file-size: propagate ls failures
Message-ID: <sUI2VEkGvVZAaS9coOZgW5XuXrz9VZ8r8D8D0dl4QKcYE5UcD6ztNP65YqrUDANS-Ok88rfAOg-n5Yy8HBL0c0VjVKIo7qj9fY1G9vb4hBE=@protonmail.com>
In-Reply-To: <aupKRv-2wbdei-Dg@levanger>
References: <20261103164204.129681-1-info@daylightlinux.ch> <aupKRv-2wbdei-Dg@levanger>
Feedback-ID: 330522:user:proton
X-Pm-Message-ID: d570f38967c6c4f6867a6bce439c2229b3c412e1
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thank you for the review. I tested the script in isolation but missed the e=
xpectations of its callers. I understand why this change cannot be applied =
and will not resend it in this form.

Best regards,
Hamdy Abou El Anein




                                  **Hamdy
                                  Abou El Anein**

                                  CIO / Senior Linux System Engineer




                                  =C2=A0 info@software-coders.ch

                                  =C2=A0 https://software-coders.ch/

                                  =C2=A0 https://github.com/hamdyaea**

                                  https://www.linkedin.com/in/hamdyaea/
                                  **





The
content of this email is confidential and intended for the recipient
specified in message only. It is strictly forbidden to share any part of
this message with any third party, without a written consent of the
sender. If you received this message by mistake, please reply to this
message and follow with its deletion, so that we can ensure such a
mistake does not occur in the future.

Sent from Proton Mail for iOS.

-------- Original Message --------
On Tuesday, 11/03/26 at 21:56 Nicolas Schier <nsc@kernel.org> wrote:
On Tue, Nov 03, 2026 at 05:42:04PM +0100, Hamdy Abou El Anein wrote:
> From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
>
> When ls fails, set -- succeeds with no arguments and printf emits an
> empty line with status zero. A missing input is thus reported as a
> successful size query.
>
> Capture the listing in a separate assignment under errexit before
> splitting its fields, so an ls failure stops the script.
>
> Tested missing and empty files, a 123-byte file with spaces in its name,
> and a symbolic link. Successful output remains unchanged, including
> the link's own size.
>
> AI assistance: ChatGPT/Codex identified the issue and prepared the
> change, commit message and executable regression tests.

While implementing shell scripts with 'set -e' is a good thing, we
cannot apply this.

NACK

The reported issue is not reproducible with all usage of file-size.sh
within the Linux tree.  More important:  if file-size.sh fails with an
exit code, it even breaks some callers, which expect file-size.sh to
succeed always.  If you want to investigate, check all findings of
file-size.sh within the tree.

Kind regards
Nicolas


