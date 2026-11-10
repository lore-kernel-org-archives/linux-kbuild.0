Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268862;
	b=2OimV/YbcOKhm9gnpoAmnzbK12AG7wQWQIEpeZhLsKB/UByRR1eSOM6vOit+zeihF9AL
	 8P/DJ94vhrkhUPtlqGvVpG/PMXg7UjjS/XUXwU1JYjY0L/G0e/+ihT27pghACUkjQrYww
	 w8N0mtcf5bYCWxGkIZtPISrgrG6Wh1B7j0I3fnTO1AOiw6Mxpw0zjpUbQO/5qZXgx58Hg
	 /rjPyFOHn4bSUkfcrrzwo1Cj2tkwY2kmQvUMtkKcvSwbF7CmJrnVvswrj5MKAzCJFQMK5
	 BUDoWr8bskIl42yqhQ4CVyZuUnhmrbeH25fhdP2ihZSp75R9+wYmiPrTJyq1qK94/bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9x4lnHdK7YNPAnHqjvZiQM9lHoXo9bX8pnE2rbAPLAM=;
	b=djFBdf8kuaK2B8lDUjD2Bjqx6uLaNAnz7/544AHppVJ7KTaRrYhWhcHquL4E98As/XLs
	 JpYb3R7Uz5/BqJPKPyMLde5Lolcd6DHFnlIo9dMxArlzlL1jOnwM19fH/gk12uQQVq7Mg
	 D41PbWj0dQ0GTPrXTBsRF1DuccBwReqjoKkbBQXs2V8HqBKRt7Cat5W38kzEYMPHT1TGN
	 RCpatIT+qts8MbNYTFuvsCxBQcexdoy4lrsmfkvD7U4wWQb7pBZfu+SMOdeuQ8nczIPYw
	 Mkz3miWdBzeiJZUhrqjmhtSxkFs024osrVT06qiBAwyuoYzSZ0wH0HuOHeWV7xWhQrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7RC2NVo;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA1C60A2602
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 00:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA1C60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7RC2NVo
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-56431524c22so478071b6e.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Nov 2026 16:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268861; x=1794873661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9x4lnHdK7YNPAnHqjvZiQM9lHoXo9bX8pnE2rbAPLAM=;
        b=R7RC2NVoQixknsIsgRzs7wRfrhDLQAb8E7VOo6/yrbSMzS8cO1LML9sPxR1I3UiO5m
         hvOZqF1AaOk9I0adgJwFRXQkTAKoFTs7tKt7UNiKfpa+lPfJKEQvhXoMXaEZl1xBzd9V
         nPu3mIiinPHJcECzopWWrTRY+0nzF29o05u0IUjgniFLpUIgAczirASUrpCNXYEX0Jda
         99Q8w1qfoBgzhUUoeNDPG5p4S7e8G10q9pukAh6hnLrk44r/QNPneomO8qeTA3gC8re4
         h5Dz4/w7IX5kADfKTYA2EV+F79JPwkya9bHM5MzmipYJbP03Ol+UvBDtmdxEfDtL/Ty4
         /FTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268861; x=1794873661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9x4lnHdK7YNPAnHqjvZiQM9lHoXo9bX8pnE2rbAPLAM=;
        b=GUBrSAo60OzTiEt0Ai3qsBiftsaa8zvvsTpWmVU2bJ83D6BARFchFDwR19mpfUDiHO
         8VympvgWilBB5afg74HFma6qiKRdGJEH5PiAVC7f1qonDoLbGiqqzVv3ms9RU9Zs+2ha
         2WK1kbHwANtcAwzVNDHE8DseehAK/M5LNvY+IkZ0bEjxIldQXl/1VBvvU3Ad+fcqKZzO
         KtqNshKVibfuc0ExLi30W2xuBuwpLEuf0Qpf9U+GS1JiNQzRXyrtZGBFceHNOWSnDNgG
         hM+qmOO/akmvjmPlFL/fmKIDp0TtVDCYOtZVdM8aNHHxb5cVOEfiGwkTOEqAHO1ofOJb
         6hRA==
X-Forwarded-Encrypted: i=1; AL+hErEfakyvlZ7WC+tLkZYPHhIrHzhlylaGuCDMP3Q/hPd+cI/gjLNIB+g0hmVEyg/u3O1I7eIwS3C5n1tCtT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z97QQpBSOP20bwUHlNs43C72HgKgofyAgVsO9pySDOSQ74fqYrr
	QyNhIOYOUNcERUYN1TEIYQMII/mhr1FMjYEIM0IUicG5ZvM289l5CqXn
X-Gm-Gg: AYBFou38coiL6/qzj5bqn3MDjo08QRQYfuESJwZ8q4UlpgwYcNBjIgd4ry+3RIq75tt
	zs9KRVm4jlZTwNaQWr3NDWY/stmHCd77Ppm4vcJTh7rCbz9dEI2WltBJCU32d9apK6xcxP069X1
	1nBfcEVLTVFS4BfwagJOTINzkEnJlqYyeOV//GPlEUrlhM98GuYSENqCloeHqIQtRotVTxpGazj
	KyI7hzkpoGduYifxEaILcdEYJLUwCmMtrXUR0ibyshUdWIhSLGVXyEiISuxL61BebUn/4MtqC40
	ODQi9Kz/O6i55HpS8A5+ezy9ilTAiocCmH46K2W//14MOnIKVpT/Hc30EMrfKycV+JatvUaqPv1
	9OjbsntLde7r6OPYyjmU7EPtpLGEH7vdKtHDQcy3N/codkLlodfBupg52Pje/USf9c90Dx9iq5+
	mK5LuY55sO53waQGH/35PoPNU79sSAjib7mW6FJFKgS6wQGURJ3ylZxlWzozBairPcAxVSd151E
	OHssbSEVHKhizBshzK0gn4a665mDeB+d3EM1AgDxdA0AJv0C8etIXquEF6ATo7KuNuDuVa2oMni
	KlecJ49Vrb1qKC1oQd6ayPOtCULt7ohGtlXlPluIDRg=
X-Received: by 2002:a05:6808:5094:b0:4d6:90f3:74b2 with SMTP id 5614622812f47-5683cb012b7mr963798b6e.50.1794268860737;
        Mon, 09 Nov 2026 16:01:00 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:00:59 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: masahiroy@kernel.org,
	ardb@kernel.org,
	rostedt@goodmis.org,
	hpa@zytor.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v3 3/6] modpost: fix handling of short reads in read_text_file()
Date: Mon,  9 Nov 2026 18:00:00 -0600
Message-Id: <20261110000003.1719966-4-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000003.1719966-1-lzsx618@gmail.com>
References: <20261110000003.1719966-1-lzsx618@gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

read_text_file() loops until the whole file has been read, but every
read() call writes to the start of the buffer, so after a short read the
data already read is overwritten and the end of the buffer is left
uninitialized. If read() returns 0 before the expected size has been
read, the loop never terminates.

Read into the correct offset of the buffer, and treat an unexpected end
of file as an error.

This was confirmed by limiting read() to 64 bytes per call with an
LD_PRELOAD shim, which makes modpost fail with a parse error on a valid
Module.symvers.

The analysis and fix were prepared with the help of an AI coding
assistant; I reviewed and tested the result.

Fixes: ac5100f54329 ("modpost: add read_text_file() and get_line() helpers")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/mod/modpost.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 75374c64b8cc..1772068dc68e 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -143,11 +143,15 @@ char *read_text_file(const char *filename)
 	while (nbytes) {
 		ssize_t bytes_read;
 
-		bytes_read = read(fd, buf, nbytes);
+		bytes_read = read(fd, buf + st.st_size - nbytes, nbytes);
 		if (bytes_read < 0) {
 			perror(filename);
 			exit(1);
 		}
+		if (bytes_read == 0) {
+			fprintf(stderr, "%s: unexpected end of file\n", filename);
+			exit(1);
+		}
 
 		nbytes -= bytes_read;
 	}
-- 
2.34.1

