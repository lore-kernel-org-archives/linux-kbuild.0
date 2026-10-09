Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB69C381AF
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2026 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541164; cv=none; b=dkpqeKKCOFDSRtU0jdSTnmgTUHSR9bi7IvjQu64/02jtoeZVGi0t3oiwU72iWxSd8h7Yh2HZCA5EFf8ozlDaHJCvxFKtTG3kIShkVefs40wENHxSD8f8HJt5LZCKIv/nV8vPGSBD95gVTSfnyiFlCRjkaXyu0jonCINKpKtqlC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541164; c=relaxed/simple;
	bh=hZhsorpyhrdePy/eS4UBgZy3PoTlUAnavPITsk1OkvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KU5E8qvv+2td6Ydpa1EKzl0Z675MAzKxNEChY9TKh/+KkBfAoV2cTGiRRSmVO4Sn782B2XrANuw+SrjWb+NQwZp2M2gdlq5AoQJF5a/SDu5pyH3spe62jcgeDppxurCD4EX4Dn9dpYYWbzBs39kDxXC/6druLpFZxBYTQaAB1Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com; spf=pass smtp.mailfrom=egicon.com; dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b=BvDBnx8n; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=egicon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b="BvDBnx8n"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a168355946so35990345e9.0
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2026 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=egicon.com; s=google; t=1791541159; x=1792145959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/IxRkMGThu4h80nLCH1Odchuo85RZD5Hjt36tJqVTTI=;
        b=BvDBnx8nC08RrqlYhZSKKf6LOvcsIv8KTrEy6A2VHCUy73c5jWtJlCNEllUFvT5g87
         m50sq3t4TALfi+YhlZ1Nm5OObhWXWAGUKxAsrOzxaSeepYRKW9NszwXNkMzmcDRXZH+7
         4d1OFKfcsMGqJsJCE5zLvW+8Srf3XhKJf+i842p0gs914TNjlLHhaMFrkH7LGEQ7mAHW
         wsiO8iV/h2sK0H/lUVaX/lubC0dUvXqS58vN//SU+2khTKRtlnO0C9otOhpPlOeWLKgN
         f+Y9q9GuIIF3Mkyg90Z6nsOpknv2Gox9xWXEajsSII4LW99rfrBpIyQ1cfNrTV4Zbk/N
         YAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541159; x=1792145959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IxRkMGThu4h80nLCH1Odchuo85RZD5Hjt36tJqVTTI=;
        b=EPxGTlKjNVmAjmi0zVu0tQHbTRmzPdHY6/6bD+WtkbCpO44T7vso0RwAsvGqE0fh7Z
         TW6VdC/MstCkEsHNbC/2IF9uHnz7FD1SkhDYfcPk6rNkSXdbggNB1bbnlPWcJb49jwa0
         VLfctFQAEX83M7+u8vRLwXdaZIB6L5GrpFk/+ychL2P1h0FzP/PpTDY7b156BTjhBBfG
         83nr2imaGFWZ5iFceK1lkC1cgi+lwArPZ2plj/c7AEqcpsXxraF17zcZ378sfQa/OUNm
         veYc3zQkVg2ulud8Y/sqmtQE0ZA+DD6rJbXogioJqRPt/EH/2LNfn8dt3LuVPKjiXFhH
         rGeA==
X-Forwarded-Encrypted: i=1; AKwUvBzxOcW3JBjqHPKQKvIls0coTrQ5/WwxXojN+N1IVL1d4gWModcYXsGFJdkZYSdmOp8uxEtW4zh3EHkCInk=@vger.kernel.org
X-Gm-Message-State: AFuF++kdUVMyVZSWmWp+1fnrbSsiSzkhCmQvRudGqw8EDECVkhnc0zEG
	ge4rWRVURApYHLOneo/TYaTtSBHXgCyHMU8Jp1fd1Q+d5V+T/kYKsvpbZyRZfmzK4w==
X-Gm-Gg: AYBFou0JEaW1p+YncI5iM2BHpSHnL97ga/+vocQ3aKgse1T2szPRvx2pw1ejArMJ9M2
	rCqNkzhDxvb6yRkj01/qWmktvP3nGxm+mrkaz3+Vxx+9STF7PqJb2+z7UCDxChM6zgJ7ATSpvRf
	iKCoaomU8P1U4dTcyk1c04VmUxc8rx2ColtkKvP2YN8ieANj5r+Ff9QJPQ79n8jTh+kLfGHTSLW
	7vG3wlqLEVdn+EaN1pxhTqOPds5CnwhiflFOOD0CODIToMKhazBt2WEW7GHdEPM4nWbfSQThR4j
	C9rm/wjwOF6YSGp4SUOjqHLncJtR18bG5Tvt41cVNvJ3gTjwTlg1yoCa8ccbOjlJpzGoFjC//4L
	qW1KLY/0hS8oN1Ohdn9JvOw13Mq4XCsc9EhUoirYoNCPCBMAziyLhaFTnG4FypJC/iGumtr37jt
	IZq432+xn9LlOXm3vZmRmTWLv/9pX6MqFcp/jVPcUf5hIcGOH4tEwd5zA7kuKrKWQR9leMczOp9
	L8dkA5HcCuCXqoEY8KuguDTwOMmKEqvUFjb4JFePWnHg+QxI4QaL84DTvj+dYGL
X-Received: by 2002:a05:600c:3494:b0:4a0:bc9:28c6 with SMTP id 5b1f17b1804b1-4a18e4fb31emr24381795e9.34.1791541158877;
        Fri, 09 Oct 2026 03:19:18 -0700 (PDT)
Received: from xpsmax.egicon.com ([37.179.95.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acf12bsm3189363f8f.46.2026.10.09.03.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:19:18 -0700 (PDT)
From: Massimiliano Marretta <massimiliano.marretta@egicon.com>
To: David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: keyrings@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Massimiliano Marretta <massimiliano.marretta@egicon.com>
Subject: [PATCH 0/2] Add bulk signing support for PKCS#11 keys
Date: Fri,  9 Oct 2026 12:19:13 +0200
Message-ID: <20261009101915.495734-1-massimiliano.marretta@egicon.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for signing kernel modules in bulk when the signing
key is stored on a PKCS#11 token.

Currently scripts/sign-file signs one module per invocation. When
the key lives on a PKCS#11 token (e.g. a Nitrokey HSM or a
SmartCard-HSM), every invocation pays a fixed initialization cost
of 25-36 seconds, which dominates the actual signing time. For a
typical build with hundreds of modules this is impractical.

This series adds a '-b' (bulk) option to scripts/sign-file and
teaches the kbuild system to use it automatically when the signing
key is provided as a PKCS#11 URI. The classic one-module-at-a-time
behavior is preserved when the key is a PEM file.

Patch 1/2 also extracts the body of the signing logic into a
dedicated sign_single_file() helper. This is done to keep the
new bulk loop in main() readable and to avoid duplicating the
argument parsing logic. The extracted function contains no
functional changes with respect to the current upstream code.

Measured on a build with 50 modules and the key stored on a
SmartCard-HSM:
  - before: ~24 minutes
  - after:  ~3 min 17 s

Note on checkpatch: the series produces a few "trailing statements
should be on next line" errors on sign-file.c. These come from the
switch statement in main() that is moved within the file by patch
1/2. The affected lines use the exact same style as the current
upstream sources (case 'x': stmt; break;) and are not introduced
by this series.

Massimiliano Marretta (2):
  scripts/sign-file: add bulk module signing support
  kbuild: sign modules in bulk when the signing key is on PKCS#11

 scripts/Makefile.modinst |  43 ++++++++++-
 scripts/sign-file.c      | 159 ++++++++++++++++++++++++---------------
 2 files changed, 142 insertions(+), 60 deletions(-)

-- 
2.43.0

