Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268864;
	b=x5MNzEVQB+zyVsSfCAEsPM3kXaq3nD9hjEuDVvuF9GqQ2LkHVb2vvO/cismEzHhUllLc
	 ZxGzmpXfSTXYtarunK8fisyr56FxznrJEbWz79lGzgGdmIkZZzgQ4ik17gAVi/LLWciLx
	 fUGC+ghaWavnqqgnXdD7yeM0bztQjps79wqCjS1VMa1zUCFFWbA+ciRy2Umk6lg/n04Fa
	 gzaPKJsHGpNGL5nkMV63jwq+PK3bJocYGTquD+PiB5qcCtuhvdbVoOyb4ACGPlMtqWKkI
	 Lv1bBWKH88FSmYi/y4nKCCU09rVm9EQACgUiF1lhcg2ng+oBHBQlE0+EBRaTnZPXRwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GNB0X7+XipJb4nexBOoRaSCIpW4lOyXDa+yUEHQilhA=;
	b=nWyaO+ORDORCvsQr3it+ceulEY5F+9WSB0YRc6Zx+cV/M+c9pky8ybCGBO6lu3T1KV3s
	 MvGQAKzeg2+xUDccHxvcQUp7oggnqHaGpzMD2NtXqahUobTIn95NhBq4V5hIPDfnZW69M
	 DCyT0/cl/LIRVx4hbM5JcV4iyqHTRTNp76NmNe8nPAV5RcS/OCeNGRxK2UpYUILhG4TF6
	 VaAQJzey1IZScQpLN8Cd0ckTdzOV8zdRwN7FlkTjH05LmCE37g6dY2048vXRkXS7W255u
	 qC3wwJZ97RIk2uLK75xRpGU1c3Nbw1UsFew/RIF4MGizvKUM/ps433d0K19MbqdVfHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYZmPJ9C;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13A160A3814
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 00:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13A160A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYZmPJ9C
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4d7034a99a9so803428b6e.3
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Nov 2026 16:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268863; x=1794873663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNB0X7+XipJb4nexBOoRaSCIpW4lOyXDa+yUEHQilhA=;
        b=BYZmPJ9C4iKDt41duCZ9z3I3JPpn0tmSD1L1L8RWTTgQr7K3hZsRGCJeGJOA3T/wJm
         1N/2/vTfkxcyPP6M8FLvtbJGUq500XCsSoLnFu4DeAnXLygTHUeDXPLRGVG8xCvuUuaD
         bRsdtx57G8RoHynWfN8u/mw0Tgdk7IW5Ww6WyDwvDAcu1OOQAy6SwkEtteDBdFn6Cu/d
         2mjdC9eZ7vxDbmcOpZJpVCZvRuxnQIjTt3pMPoGUW2uZruqSJPSMdJc8QX8E1+T+bmNo
         ZMD3O+pvpWstMklEL5ESDfk07clM/8QLZQ42rlCbNJnwnDXlputp+RVP9lmf3mEzxNwI
         wqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268863; x=1794873663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNB0X7+XipJb4nexBOoRaSCIpW4lOyXDa+yUEHQilhA=;
        b=pmSzMiTrdQzqtRkpUeWw627Rax4MatD1yWz/1ra2+qOAcOghgCrOpCxR+b56lFhh7X
         pmc8bY2sogxDb0kju1D8mF7gxGKPCC4CHGC9FVGykfRiY3l3xwadFHWV5dVgHJqJBekM
         oE56hhPFWmrnfUwMiQa/qZG+I74LO0n3SpSiWAXmSF9s5tAaXD8Kzjj20V3lMj/0Aq18
         zAO3FYa1XSfc0auBByWSMEsGGRZllBYEvb/NqcLvOaEPAoQuEoOvXhEjonbSjS1dxE01
         vr4fXBhGZ/dEmONnysWs5+fdxetlbldIB4T1Q6P99DwFYYXuyZlnPQeZogCorGxPbMSX
         P/bw==
X-Forwarded-Encrypted: i=1; AL+hErGc07+JNzl1pDyycccS8sH61XVUi7ij4lmqWlUAaC/hrs4x660b/TZU3F5D9aAtx6x+3LxJgBNmM6oICU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JSFzxwpqYHeytKD4clW+Hemipn0wBuZdVsA18NQfvVYM22bA6
	w+ObYV9VUr+7lsSEMtynvmnYo+G3ECVCaEVMuzGnFq48ktF3GUW1Q2vf
X-Gm-Gg: AYBFou3oB1N4rxtn4MTeaXi8Kp8725ELwVGs7qpDhZGPH8KzoA09/2H0a+mUvHTBFDz
	kg+W3TBi/rbGVqCOjlhDcUrjuVU2kNlFRkz0J4k8tj4+CALUtWWQtPS6THyDSxaoX2j3Pt0+RRP
	oH7I4CzmUAw8qCzfulikOZXz+vGa0mooeltzbGuYkFJWqzqizMTZ0lvRZaf4Ob0nLPWrnPMchHb
	PywCEyP3oYi+z0OVEQZgIdqMOGVj7odwxk7D5+Yg/b3823ONvipYgQRUB1LnXRK1RpSUCyOgh4N
	3NMldmf4iftKufHbPPqxeAl1dnc9VsS4dDUL05Kb55fl509f19UQQ+HQi/AWBG+MVtMKhyjFYDH
	6D8jyZkNsxFo0fBDSmy/WpcyHTk4XlSjpPJVWA2m3Er1ky5N1CZHZoVBRuODTqpGt6JH8JpzYII
	L5Gbh/ZcXV65lcN+JZh4o5c2vyxBEY8pj8uPF6SOomZgFJf6WovScB4OihErReRIjX0cghgvU1D
	4a0OO+ri3ETwsK6x4aG8uoIY1j4W34rhBVt7bzJqQkXzx39gPGieTFTWUgL9tAZhfKABHAUNWbS
	xLWG6IHZg55FiTup64tDawY5UmDqWIogxHv8Hkremtw=
X-Received: by 2002:a05:6808:308a:b0:564:48f3:dfac with SMTP id 5614622812f47-5683ce042fdmr929817b6e.47.1794268862779;
        Mon, 09 Nov 2026 16:01:02 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:01:02 -0800 (PST)
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
Subject: [PATCH v3 4/6] modpost: fix pointer arithmetic on NULL in parse_source_files()
Date: Mon,  9 Nov 2026 18:00:01 -0600
Message-Id: <20261110000003.1719966-5-lzsx618@gmail.com>
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

parse_source_files() checks whether a dependency is in the same directory
as the object file with

  (strstr(line, dir) + strlen(dir) - 1) == strrchr(line, '/')

When the dependency is not below dir, strstr() returns NULL and the
pointer arithmetic on NULL is undefined behaviour. This happens for
every module with dependencies outside its own directory, and UBSan
reports:

  scripts/mod/sumversion.c: runtime error: applying non-zero offset
  to null pointer

Check the result of strstr() before using it.

The problem was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/mod/sumversion.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 3dd28b4d0099..4c59e7cfbcbd 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -364,7 +364,8 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 		}
 
 		/* Check if this file is in same dir as objfile */
-		if ((strstr(line, dir)+strlen(dir)-1) == strrchr(line, '/')) {
+		p = strstr(line, dir);
+		if (p && p + dirlen - 1 == strrchr(line, '/')) {
 			if (!parse_file(line, md)) {
 				warn("could not open %s: %s\n",
 				     line, strerror(errno));
-- 
2.34.1

