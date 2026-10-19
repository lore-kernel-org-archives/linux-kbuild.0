Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445127;
	b=x7Eqtq2Y+Q/J4OaZrQG6aSHY2rdefC8BQHRvbZX8zPTrmtYH8ijLWuX/NMDy55Rxjef4
	 JhYQBqOM44LjLakAZ5H6MfZb1+ZRR6R8sW+Fbnor0dGR0J9SFrEesKVq66TUAJlJHVBFU
	 PlerSxBte8+kwbzFszKLC88skGX0WCj38qG/gHjosWWk7fFSaRJW90qKl/bz51jRFkWYk
	 XWuG90V3cDx+YTLcMqnzN3m5+KR9Sjok7EjXbrlFk8t3dGT07kuxjWq94BHjUC6AlvqkN
	 2IRNU+ny5klJed3dGuaJSAuc4itgfWSUBhQVtUvDDunDxRF4D4O4SdeDGrVqw4L/5Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bqwC/Ywk/urErM3liCKcvDfgOsAI1aXiD3ThAOoBayk=;
	b=nqgQ6utAfIfvQyMpLTIgoZIYwlor1Mdh2zg2T57TYXFaM5ox0s/cs4taZuGIWN2s9hv7
	 tT6H+M61OdXyt0LC7utqSm8KK6uIj4Vz45SDA0p4rla9hSsUNYoLY0ChXpk2hMfCrO07K
	 /3Ks0pLPkYet+aCoL5OS6IM9f8xM1tZbu+E5aWuLv13rqPX9JlZIdxpW/73zZM6kG41NS
	 gOPt6qEjvqCrBFLrqoxDPgtmD2sWyMfJ4WSmOOwyWoWctSsfW+M5sbZ0N0/TnlywLsFS9
	 plHqgpL21GHi78NXpr0+jTGQB/pFhEyfXq23ZPwvmuSjYh4wWxN38gjgYfKfhs3hV1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QbwFx2Zr;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F276606A31A
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 21:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F276606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QbwFx2Zr
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso16284865e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 14:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445126; x=1793049926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bqwC/Ywk/urErM3liCKcvDfgOsAI1aXiD3ThAOoBayk=;
        b=QbwFx2ZroypK6R/rCW4N5ltjtXaEJgTxUGJvQO1nqB+DU9ME2G59z8HDKJQ51VfX23
         RtYuMHOGf14Htyx7tDSGfP1iwrMoFmICI9dbtDu8D3AsvvREwp3KfC4WRG1l6FKWyFDK
         knV4MBl6J9cX84x/hlz0huPYI7PlUYQ3FqeRM3q6Ul5/MmAfvkeZmhzk9YSEUfgrcDC7
         2PbZq6yqCcmOUUlK6e0MSkPd/uI8CwIGck20xu99WHf5qlDCT9i8YKP1Y5tHBsWo50Z5
         pd1kc36ljY49xYXhn94TscBpCeW81TSKLYfSp2m5ZHZ1wspmLtYZpBMI7ScZezVw/7lA
         Exyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445126; x=1793049926;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqwC/Ywk/urErM3liCKcvDfgOsAI1aXiD3ThAOoBayk=;
        b=B7dLAWWli+t3yWIC5DzM6ZNeSbup47Ce4EAAtRHGnd/YvkmWlQiL24Rwnj1KGpnX6r
         uHYl6Ph0zxnBvHDn5bYWFm0fpG63rsbVdb6k2uDRNwX3fC4tZS+Hr9mZSHeLb9utnbLZ
         m8Vof8iMKecIGUhGBGS9G+1QT2sjeQcJBOFJt8MKS+I20KJo51KY/dXR2vX9XwnXVN5F
         f1Cv2CM7UFVMpDD1cC9sMLigS+K+iB8Cqgx3NiPhFJu9C3jjDaRM4Oyk/31Q1/yPsnJL
         uJtUi3PhX6hwyqtKeb+A/ZZ3zMPrik9h9rJ2efv3lZR1GtY4QlkhF05Vi+cEDbzFV4NF
         Tcrw==
X-Forwarded-Encrypted: i=1; AKwUvBw5pCmMdfGu2k8UFYKzLc7PvuDrbL8v4EXt8YL2RA8qGNTvs7WH40UEBP8eUm4XTdTDbYXoMBn+m/l5nxE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2lEbL5YoFoVPMJuJPRKYvYsNJtugpc86dLgAIpytYAmdolFC3
	qmiqShOFA8Vjl7ifJqvUP+UQcDDXv+g+JnqN8F8KgmnNtg4Y6ZaNpv64
X-Gm-Gg: AYBFou1y0ojMxQguyd6BQRchxYfdvbrMMcZu9Y3SA6lwXrtpz0sLqjTxuoc1VQZ25rr
	J5Nl05wbPdkfVmvZGmMAO4oZQolw6VS4QhoKOt7sUeI4g2gWXMvZaUrv3bhwABfgLZ1VuKHjdcc
	9jUrXEn8tdm0VcJsdH9kKbCx/3QQ7I7kXksBPBaYBfxE30YPCVXzFCgJZBqv7HulQqBcaIt/mhJ
	BEMifenp56OruDCcIBUGGxNI4GTbVIYxEAeOyYr6XxotjhX2CfuwKr8E4+0xTXNFd44QWVgSS3A
	fuMpuNkv/FdA4+V7vLIijDmkBC5BK655LE63KH+4bngdHDfhjVtPOQIyNyXGjCj3MMO+YrASDBz
	x2bp8v6HDuImqp85CxctCemg9C53JwNkt6gHlY7ZilkBnr6E8CV65qmZ9noa+4HoNZ01yl7t+XS
	qKuyA/LOSWyq/QbplzwzNN/3jGz1VIMbedG5IEAklxKqBL55HzSSQ07cP7DnVHeJRtB1SuPl1WX
	Up9IVj9BdEq4ib+WfuYZVVwoVo9LtHOxkY=
X-Received: by 2002:a05:600c:c8c:b0:4a0:bc9:28c6 with SMTP id 5b1f17b1804b1-4a1d7643dadmr171548545e9.34.1792445125587;
        Mon, 19 Oct 2026 14:25:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c1e0e6sm25118305e9.0.2026.10.19.14.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:25:25 -0700 (PDT)
Date: Mon, 19 Oct 2026 22:25:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 next 03/15] kallsyms: Improve selftest
 test_perf_kallsyms_lookup_name() output
Message-ID: <20261019222524.695a4d31@pumpkin>
In-Reply-To: <202610200434.qSHPOyDo-lkp@intel.com>
References: <20261018155206.132411-4-david.laight.linux@gmail.com>
	<202610200434.qSHPOyDo-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 04:57:54 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v7.3]
> [cannot apply to next-20261016 next-20261016]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/kallsyms-scripts-kallsyms-c-Avoid-overrunning-on-stack-buffer/20261018-165152
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20261018155206.132411-4-david.laight.linux%40gmail.com
> patch subject: [PATCH v2 next 03/15] kallsyms: Improve selftest test_perf_kallsyms_lookup_name() output
> config: arm64-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200434.qSHPOyDo-lkp@intel.com/config)
> compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200434.qSHPOyDo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610200434.qSHPOyDo-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/kallsyms_selftest.c:82:12: warning: unused variable 'The_time_has_come_the_Walrus_said_To_talk_of_many_things_Of_shoes_and_ships_and_sealing_wax_Of_cabbages_and_kings_And_why_the_sea_is_boiling_hot_And_whether_pigs_have_wings_O_Oysters_said_the_Carpenter_Youve_had_a_pleasant_run_Shall_we_be_trotting_home_again_But_answer_came_there_none_And_this_was_scarcely_odd_because_Theyd_eaten_every_one_The_moon_was_shining_sulkily_Because_she_thought_the_sun_Had_got_no_business_to_be_there_After_the_day_was_done_Its_very_rude_of_him_she_said_To_come_and_spoil_the_fun' [-Wunused-variable]  
>       82 | static int kallsyms_very_long_name = 1;
>          |            ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kallsyms_selftest.c:69:33: note: expanded from macro 'kallsyms_very_long_name'
>       69 | #define kallsyms_very_long_name \
>          |                                 ^
>    1 warning generated.

Duplicate, depends on config options.

David

> 
> 
> vim +/The_time_has_come_the_Walrus_said_To_talk_of_many_things_Of_shoes_and_ships_and_sealing_wax_Of_cabbages_and_kings_And_why_the_sea_is_boiling_hot_And_whether_pigs_have_wings_O_Oysters_said_the_Carpenter_Youve_had_a_pleasant_run_Shall_we_be_trotting_home_again_But_answer_came_there_none_And_this_was_scarcely_odd_because_Theyd_eaten_every_one_The_moon_was_shining_sulkily_Because_she_thought_the_sun_Had_got_no_business_to_be_there_After_the_day_was_done_Its_very_rude_of_him_she_said_To_come_and_spoil_the_fun +82 kernel/kallsyms_selftest.c
> 
>     81	
>   > 82	static int kallsyms_very_long_name = 1;  
>     83	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

