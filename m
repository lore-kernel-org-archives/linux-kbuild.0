Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBBE457E73
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2026 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541163; cv=none; b=PdAXCJRiIB0S5iS4mzVPF/iQ8+2TkYRKChpv6/mV2pdOwXOEWK70kLAte0cC+nEc0prHAKGwcZrBO+uRwXUT9L2Dt60VZ/RbEgoSNQ8CGeR56H0fPplopaWjTfReEZWIpGB7d+T+NfApVo/FTlDUbLnKK8ZtSeVsnmDETpehYXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541163; c=relaxed/simple;
	bh=/fkyHXb3VwCsr5Urp3Xp9YIdu8mewUpcr+aDP8HiP/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBw8YAcMpPTizEPdAANCpUp02MUmq+XF6K34LzESro5ZQLP/bSqVQpqg27j68Iy0UR07/e9COlk6rFjPw39pUex3vH/JYSKILbZsiBY5lOZfJ9i2dXlrWQGKmEE0PyNGAtURPshhNgLpUx0xkOW/GVaqHyEDi6CdMJLT7DhhEeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com; spf=pass smtp.mailfrom=egicon.com; dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b=CQUqNEWx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=egicon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b="CQUqNEWx"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2517626f8f.2
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2026 03:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=egicon.com; s=google; t=1791541159; x=1792145959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+PiZHw29u045WP6AUybYl05Nsv+v/dCEoZaPbR/Ppc=;
        b=CQUqNEWxvAxnNE8pfPYEpVj+2WQC8F0ZY4XSjvaI+fyoVgpow6y4UMAp6g1JAmyQo+
         kc6ZHza8MtAve+xOnSuhcM/7ghPGFcaAWyztx0l1+WS1zrzFgVPyvqYW+aGNXdGflckR
         ocJBh/wm/ergA9dV67wnKDHUPXQSjGcAfGxCqb+4KcQBqZ1Xg1CxJLDiEmFxaVh6Wrs7
         LIOTzNWcaJE90GQISo6d67Bs4CgQFQgxFRcEbyrql85kyBsjiDANbeSlH0FcMUTU+Qg2
         /HVw5y19Y9JKV56CPrQEsTb81PdEuIDDWuVaxctRZ3b/V5EKrjJp36Uq/KXJIss6vs5j
         gZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541159; x=1792145959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+PiZHw29u045WP6AUybYl05Nsv+v/dCEoZaPbR/Ppc=;
        b=RIrWabRUZRf8jHrMpfXbDsa91YbrDd4pVkOMKKMWn4C2PHEoI7+LaFgUauNIMw913d
         Q9MeSE567ABjhOPbeTTyfrDNqDaWAsgtjljVcfD4RhsI8ViQcMrZUBnr8wItelKmPjZ4
         qAvqLIfVz0IcGncX8eDBPkSzJevAd9Bkh/YDfBTtAQmtz5E7bcT9RGtCAAVDKIolT/al
         5hqKq54/R/xAdOWNsmSKyD0Gwqa0SgWL29D2O/PGoOwvCXhjp1rqXXtc2ZAlEKAScdOH
         qfEXRuxnzkW9D24+9uwExSdP3uZsPMve5NEulk0DERhQq1iybUhksxE+wzTFIdLvj6Pf
         Xa3w==
X-Forwarded-Encrypted: i=1; AKwUvBwfD6ZO5HYFT/3Ww0+nQ2bEKpuTO76vgp4eaIXBezWj7RUtWcpbrR0u7bSTjo0fNmjA0DISoJb8FHFyYYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7wFJfhPOD/m2pdZl00fgdempaN0qxk99VgJkvhZueIsRETgRH
	mRwCntq8rf8Bj8GznyqeLVIQT8NaHvb25ERKeecSN2UNsE6ZaI7k9CU/F5Zv5KThMA==
X-Gm-Gg: AYBFou1QYxXkJb/q1DnYkPsTFaeVOLYFOa/c3fr274cTR6a6qbt3n3GliHRGmz635hB
	PT51CQoZYerDpIvV+TkPc3nMFMNuTgYL5Mxp6I4elWWFbqos12SJSA46qtXbS3fFjvZCS5+mwrD
	zMAvpJbfOtECFDafVQSZxmEdoz/pkcnFgez9lzoV1F/nDL0F0yMMsxnabnx9NWode5j+70x7mvi
	l3/IF3WOUm5dwbHGdzgOzQgerPpkHvQsrkl/InPsTPIJVtcutVYLAnllWxpZylUWPdkGq32+bul
	mP0zFuMY0xYVc6tfKMlvgWEutywluoX+X5VIuYrS0r1ITo40rI+o1YATdG9Cgwt/75gF5J04aPN
	HH2CqMO3uaufcJtr0WvPlrNJKjSPsU5v7q/E0V4Iy4ZTD2fuj3dBPHOozPgi8HxNhnT0E/kEn0w
	0whcz6kr+7VIGu4dfjS4R3Nl0wUjCG3+6iLW1+98GeeT9eowAfaCtAXQznCwFK5bll6/4IdZxMe
	ScrNP0wvzwkRTmmgHW8CtzlF0PnioOk+3fgxhBN4JNF5eBO6ezTZoUE2B0eybY9eQ==
X-Received: by 2002:a05:6000:41cc:b0:48c:7037:aee9 with SMTP id ffacd0b85a97d-48dbad48cc3mr2103538f8f.50.1791541159545;
        Fri, 09 Oct 2026 03:19:19 -0700 (PDT)
Received: from xpsmax.egicon.com ([37.179.95.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acf12bsm3189363f8f.46.2026.10.09.03.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:19:19 -0700 (PDT)
From: Massimiliano Marretta <massimiliano.marretta@egicon.com>
To: David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: keyrings@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Massimiliano Marretta <massimiliano.marretta@egicon.com>
Subject: [PATCH 1/2] scripts/sign-file: add bulk module signing support
Date: Fri,  9 Oct 2026 12:19:14 +0200
Message-ID: <20261009101915.495734-2-massimiliano.marretta@egicon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009101915.495734-1-massimiliano.marretta@egicon.com>
References: <20261009101915.495734-1-massimiliano.marretta@egicon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When signing kernel modules with a private key stored on a PKCS#11
token (e.g. a Nitrokey HSM or a SmartCard-HSM), every invocation of
scripts/sign-file pays a fixed initialization cost that dominates
the actual signing time. On the reported hardware this cost is
about 25-36 seconds per invocation, mostly spent in token
initialization, PIN verification and session setup.

Since a typical kernel build produces hundreds of modules, signing
them one by one is impractical.

Add a new '-b' (bulk) option that accepts multiple module files in
a single invocation. The private key and the X.509 certificate are
loaded once, then each module is signed in sequence, reusing the
same OpenSSL and PKCS#11 context.

Measured on 50 modules with a key stored on a SmartCard-HSM:
  - individual invocations: ~24 minutes
  - bulk mode:              ~3 min 17 s

The fixed per-invocation overhead is eliminated (~25-36 s), while
the per-module cost is unchanged (~3.2 s).

The default behavior is unchanged: without '-b', sign-file works
exactly as before.

Signed-off-by: Massimiliano Marretta <massimiliano.marretta@egicon.com>
---
 scripts/sign-file.c | 159 ++++++++++++++++++++++++++++----------------
 1 file changed, 100 insertions(+), 59 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 86b010ac1514..241f4538fd17 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -46,9 +46,11 @@ static __attribute__((noreturn))
 void format(void)
 {
 	fprintf(stderr,
-		"Usage: scripts/sign-file [-dp] <hash algo> <key> <x509> <module> [<dest>]\n");
+		"Usage: scripts/sign-file [-dpk] <hash algo> <key> <x509> <module> [<dest>]\n");
 	fprintf(stderr,
 		"       scripts/sign-file -s <raw sig> <hash algo> <x509> <module> [<dest>]\n");
+	fprintf(stderr,
+		"       scripts/sign-file -b [-dpk] <hash algo> <key> <x509> <module> [<module> ...]\n");
 	exit(2);
 }
 
@@ -183,76 +185,25 @@ static X509 *read_x509(const char *x509_name)
 	return x509;
 }
 
-int main(int argc, char **argv)
+static void sign_single_file(const char *hash_algo, const char *module_name,
+			     const char *dest_name, bool replace_orig,
+			     bool save_sig, bool sign_only, bool raw_sig,
+			     const char *raw_sig_name, unsigned int use_keyid,
+			     EVP_PKEY *private_key, X509 *x509)
 {
 	struct module_signature sig_info = { .id_type = MODULE_SIGNATURE_TYPE_PKCS7 };
-	char *hash_algo = NULL;
-	char *private_key_name = NULL, *raw_sig_name = NULL;
-	char *x509_name, *module_name, *dest_name;
-	bool save_sig = false, replace_orig;
-	bool sign_only = false;
-	bool raw_sig = false;
 	unsigned char buf[4096];
 	unsigned long module_size, sig_size;
 	const EVP_MD *digest_algo;
-	EVP_PKEY *private_key;
 	CMS_ContentInfo *cms = NULL;
-	unsigned int use_keyid = 0;
-	X509 *x509;
 	BIO *bd, *bm;
-	int opt, n;
-	OpenSSL_add_all_algorithms();
-	ERR_load_crypto_strings();
-	ERR_clear_error();
-
-	key_pass = getenv("KBUILD_SIGN_PIN");
-
-	do {
-		opt = getopt(argc, argv, "sdpk");
-		switch (opt) {
-		case 's': raw_sig = true; break;
-		case 'p': save_sig = true; break;
-		case 'd': sign_only = true; save_sig = true; break;
-		case 'k': use_keyid = CMS_USE_KEYID; break;
-		case -1: break;
-		default: format();
-		}
-	} while (opt != -1);
-
-	argc -= optind;
-	argv += optind;
-	if (argc < 4 || argc > 5)
-		format();
-
-	if (raw_sig) {
-		raw_sig_name = argv[0];
-		hash_algo = argv[1];
-	} else {
-		hash_algo = argv[0];
-		private_key_name = argv[1];
-	}
-	x509_name = argv[2];
-	module_name = argv[3];
-	if (argc == 5 && strcmp(argv[3], argv[4]) != 0) {
-		dest_name = argv[4];
-		replace_orig = false;
-	} else {
-		ERR(asprintf(&dest_name, "%s.~signed~", module_name) < 0,
-		    "asprintf");
-		replace_orig = true;
-	}
+	int n;
 
 	/* Open the module file */
 	bm = BIO_new_file(module_name, "rb");
 	ERR(!bm, "%s", module_name);
 
 	if (!raw_sig) {
-		/* Read the private key and the X.509 cert the PKCS#7 message
-		 * will point to.
-		 */
-		private_key = read_private_key(private_key_name);
-		x509 = read_x509(x509_name);
-
 		/* Digest the module data. */
 		OpenSSL_add_all_digests();
 		drain_openssl_errors(__LINE__, 0);
@@ -307,7 +258,8 @@ int main(int argc, char **argv)
 
 		if (sign_only) {
 			BIO_free(bm);
-			return 0;
+			CMS_ContentInfo_free(cms);
+			return;
 		}
 	}
 
@@ -354,5 +306,94 @@ int main(int argc, char **argv)
 	if (replace_orig)
 		ERR(rename(dest_name, module_name) < 0, "%s", dest_name);
 
+	CMS_ContentInfo_free(cms);
+}
+
+int main(int argc, char **argv)
+{
+	char *hash_algo = NULL;
+	char *private_key_name = NULL, *raw_sig_name = NULL;
+	char *x509_name, *module_name, *dest_name;
+	bool save_sig = false, replace_orig;
+	bool sign_only = false;
+	bool raw_sig = false, bulk = false;
+	EVP_PKEY *private_key = NULL;
+	X509 *x509 = NULL;
+	unsigned int use_keyid = 0;
+	int opt, i, nmodules;
+
+	OpenSSL_add_all_algorithms();
+	ERR_load_crypto_strings();
+	ERR_clear_error();
+
+	key_pass = getenv("KBUILD_SIGN_PIN");
+
+	do {
+		opt = getopt(argc, argv, "sdpkb");
+		switch (opt) {
+		case 's': raw_sig = true; break;
+		case 'p': save_sig = true; break;
+		case 'd': sign_only = true; save_sig = true; break;
+		case 'k': use_keyid = CMS_USE_KEYID; break;
+		case 'b': bulk = true; break;
+		case -1: break;
+		default: format();
+		}
+	} while (opt != -1);
+
+	argc -= optind;
+	argv += optind;
+
+	if (raw_sig && bulk)
+		format();
+
+	if (bulk) {
+		if (argc < 4)
+			format();
+	} else if (argc < 4 || argc > 5) {
+		format();
+	}
+
+	if (raw_sig) {
+		raw_sig_name = argv[0];
+		hash_algo = argv[1];
+	} else {
+		hash_algo = argv[0];
+		private_key_name = argv[1];
+	}
+	x509_name = argv[2];
+
+	if (!raw_sig) {
+		private_key = read_private_key(private_key_name);
+		x509 = read_x509(x509_name);
+	}
+
+	/* In bulk mode all remaining arguments are module names.  In the
+	 * normal mode there is exactly one module name.
+	 */
+	nmodules = bulk ? argc - 3 : 1;
+	for (i = 0; i < nmodules; i++) {
+		module_name = argv[3 + i];
+		dest_name = NULL;
+		replace_orig = true;
+
+		if (!bulk && argc == 5 && strcmp(argv[3], argv[4]) != 0) {
+			dest_name = argv[4];
+			replace_orig = false;
+		} else {
+			ERR(asprintf(&dest_name, "%s.~signed~", module_name) < 0,
+			    "asprintf");
+		}
+
+		sign_single_file(hash_algo, module_name, dest_name, replace_orig,
+				 save_sig, sign_only, raw_sig, raw_sig_name, use_keyid,
+				 private_key, x509);
+
+		if (replace_orig)
+			free(dest_name);
+	}
+
+	EVP_PKEY_free(private_key);
+	X509_free(x509);
 	return 0;
 }
-- 
2.43.0

