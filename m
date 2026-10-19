Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429687;
	b=5gZm05OlPYXvszzCOu48tHxaq15Mt4bXANxI5vRGJMfcwE3ZiOTgsrMxXZ29fzLFrf25
	 3UZwb+7U8g1q74IjDy4MJ5+DOyPTJLsG8bjukFvHhGtfMcOJekUfCIptoj1XRC1DUXW6v
	 R2EJi84ggzeQNrPYdD09h/TodB83I23i727B5TtZyJLc/WvwjVfho3Z1ziTIsObb+SnMS
	 NWMRSY3YF7cK9xCQfhh2nYqf4uq06YC0KhYAwbhKLjLtotGcY6JbvpnUvZCyeI+xxCdlA
	 uIeHLcAoLcTbKgEz/WvBl9Ju4jugBxM9g8YCoFHbE1bYCCpqYQzM7wrzr1vjjmOFg4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=z9Rf2ubDKz7ML74MPtfck2qyU1vrqP5ztLplisyq7v8=;
	b=yQHl2gAMxP7iYgvB3f7mLJGFrGANzTONdTWtXlAsgL3QK3fOh+6R5+e+t/kGAKANgItZ
	 7tFm2rFPxTGc2eknI02KAAUMrYG/f9jidSrR7IOdAOkizy/NyghggeGLEpeTfR0zmfFGH
	 qtOfQYbqADBG9T9gsD4O52mgOUfa2AkdBMLSpZ4f6kbcfFt65NpQ/YNhLOF6Tuc8AAboB
	 Wyy/mSBtzyF1le3gMpprK1t0dXkfwx8e3BX4i1UeR2IgPtn3gQr6UjSYc3cgIyoGeSna2
	 x1XSCzFJ5M89cGt3t8wf3i2G6iXtTn+GWN6QTUNRwQiON6JCTUUypcI1jKEUrhlrTpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hN5V4SND;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05920606A31E
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 17:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05920606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hN5V4SND
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df54150dfso1829056f8f.0
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429685; x=1793034485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z9Rf2ubDKz7ML74MPtfck2qyU1vrqP5ztLplisyq7v8=;
        b=hN5V4SNDE/HFB3N3cv5LHldWsl4SYF+12521DFRCCiZpfDuORmspN/Um2jdLYJZoY3
         zUWtmNM5qdCPIMuIJ8hlUTR2/APPnKF/kKILGKtIsqLGPiOgOtjzqhJ10OQZIfDprErE
         ucTxHQ1/E+h2jQW3sMFeGl98+8ktAINYbs5T1tLJZxxaMvX5TMLGK8b7NCMTNx8aFnBb
         QieABdzmmJZWvEzafqMUHjcuK78YK2rpg6tPRQ9eonHahpzWzC2bdYR/5JeiEBa+Ve0C
         sRDYhXJnwGYdsuOiOhyDKPNfjUsH2MlB7BqqgnL35qv/WBNZ5d7f5piomeMhpihfnwHo
         9S2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429685; x=1793034485;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9Rf2ubDKz7ML74MPtfck2qyU1vrqP5ztLplisyq7v8=;
        b=dwTi4sr1tJ8pvYFlXI0ledBxYLn5XclpRdSGZPgitdCZpmIPYXzWf6y6ASccSpy2yJ
         LFZ8ENjPRdGK59Zibk74rxVAeyr4tq7cIO9mFC2x2XPZqGlemHT6BaJDsFtqSm30yU67
         81vfotHCtloHkja/65EqNIpghZTYoYUoN3ohFvjVVpqieo6oDM37yEpK61O4AR5DbLse
         lyryiO0SWOKfYjcMzGk6FBDMR8B9ZuiHpdKmUese/riq4lcEq/F9/B2hJ4lG75rWNJRa
         i7J46HOQ9H5DXS/7QOf0aNQ7UtWo3VSnHN2w2iYkAxvU9XZe9oBKgezQYedOxdbbDy9m
         0Z+w==
X-Forwarded-Encrypted: i=1; AKwUvBxFNoWrAfYY9c8nVCL5vzadK45de/7K+nzvquBwMGnCV7sO29TOoACKIae6T4agwWsk3lZrzBsAptnTHx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6Om+GurFoivbJdZe4eSvzMze0X8BO3//DsCBJt+U2um/uwcHo
	FNBwSgxfjCbD1gQauFd30mof+iL1b5mfPvrbD6s91JFNwdpnkH4gwki3
X-Gm-Gg: AYBFou3lVCiquvcGhoLyTWPBJlquHuGBf4gf1OJFJ3LxO5cWZ/gAT4jRftgngEFhmvV
	GAnYvE3wbCtYs4s/ZL93yuv0u43eZcTvwu7FBvUft5fXgsgFJXIr4xFYF7N816lccvQrl4QyTss
	5excA2xSqHGUmdvvsW0UyxjfmZrbUQfwL0LKR+4tHz9jLpUOGS2dLv2DEkxBilx4/pbwZH72c6z
	VR37xQCCQ8xL1rgZZL8kBZ/GKqu47kGXtAi794JvbMqwIF4HTjCk/rL/YFZjZzQ9mlRWvEP2w8n
	7NYPmZ1m8h3QVrQPlL+m73glbWo490NUhJ3mq4DvHX79bLzgcvHahCRfRBclyzE2vfDPLd9ezRz
	VxwZiIz8tY1q//gVUmDPNyQ+SFjO6OxAbT/7RJ9mFuZEWFWyrwkKEspVoADmd6ukAMmOqvoPIhW
	/QX1NyfJRlaZT6CTb1nxK3DeXWyiUvvQiB84NvVmQXeKTXod8wTg2fL6SFGDeVDeCDpOym01GQd
	BvRJY3igxR0lA6VJLtVFqXo+9hlqE5Rgq8=
X-Received: by 2002:adf:e78f:0:b0:48d:ff81:5201 with SMTP id ffacd0b85a97d-48e07f99fa0mr12300471f8f.41.1792429685165;
        Mon, 19 Oct 2026 10:08:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818237sm146817f8f.27.2026.10.19.10.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:08:04 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:08:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, oe-kbuild-all@lists.linux.dev, Linux Memory Management
 List <linux-mm@kvack.org>, Luis Chamberlain <mcgrof@kernel.org>, Andrey
 Grodzovsky <andrey.grodzovsky@crowdstrike.com>, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH v2 next 03/15] kallsyms: Improve selftest
 test_perf_kallsyms_lookup_name() output
Message-ID: <20261019180803.3ff8c35b@pumpkin>
In-Reply-To: <202610192356.CItNLOke-lkp@intel.com>
References: <20261018155206.132411-4-david.laight.linux@gmail.com>
	<202610192356.CItNLOke-lkp@intel.com>
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

On Tue, 20 Oct 2026 00:07:48 +0800
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
> config: nios2-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261019/202610192356.CItNLOke-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610192356.CItNLOke-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610192356.CItNLOke-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/kallsyms_selftest.c:70:1: warning: 'The_time_has_come_the_Walrus_said_To_talk_of_many_things_Of_shoes_and_ships_and_sealing_wax_Of_cabbages_and_kings_And_why_the_sea_is_boiling_hot_And_whether_pigs_have_wings_O_Oysters_said_the_Carpenter_Youve_had_a_pleasant_run_Shall_we_be_trotting_home_again_But_answer_came_there_none_And_this_was_scarcely_odd_because_Theyd_eaten_every_one_The_moon_was_shining_sulkily_Because_she_thought_the_sun_Had_got_no_business_to_be_there_After_the_day_was_done_Its_very_rude_of_him_she_said_To_come_and_spoil_the_fun' defined but not used [-Wunused-variable]  
...

Already noted, it depends on the build options.
I'll use the same 'trick' as done for the other static symbols
(that is reference it from a non-static function).

David
