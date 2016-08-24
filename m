Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:45765 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752978AbcHXFKe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Aug 2016 01:10:34 -0400
Date: Wed, 24 Aug 2016 07:01:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] fixdep: faster CONFIG_ search
Message-ID: <20160824050108.GA19050@ravnborg.org>
References: <20160823184724.GA11707@p183.telecom.by>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160823184724.GA11707@p183.telecom.by>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: mmarek@suse.com, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

On Tue, Aug 23, 2016 at 09:47:24PM +0300, Alexey Dobriyan wrote:
> Do you think kernel build is 100% dominated by gcc? You are wrong!
> One small utility called "fixdep" consistently manages to sneak into
> profile's first page (unless you have small monitor of course).
> 
> The choke point is this clever code:
> 
> 	for (; m < end; m++) {
> 		if (*m == INT_CONF) { p = (char *) m  ; goto conf; }
> 		if (*m == INT_ONFI) { p = (char *) m-1; goto conf; }
> 		if (*m == INT_NFIG) { p = (char *) m-2; goto conf; }
> 		if (*m == INT_FIG_) { p = (char *) m-3; goto conf; }
> 
> 4 branches per 4 characters is not fast.
> 
> Use strstr(3), so that SSE2 etc can be used.
> 
> With this patch, fixdep is so deep at the bottom, it is hard to find it.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
> 
>  scripts/basic/fixdep.c |   67 ++++++++++++++++++++-----------------------------
>  1 file changed, 28 insertions(+), 39 deletions(-)
> 
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -82,8 +82,7 @@
>   * to date before even starting the recursive build, so it's too late
>   * at this point anyway.
>   *
> - * The algorithm to grep for "CONFIG_..." is bit unusual, but should
> - * be fast ;-) We don't even try to really parse the header files, but
> + * We don't even try to really parse the header files, but
>   * merely grep, i.e. if CONFIG_FOO is mentioned in a comment, it will
>   * be picked up as well. It's not a problem with respect to
>   * correctness, since that can only give too many dependencies, thus
> @@ -241,37 +240,22 @@ static void use_config(const char *m, int slen)
>  	print_config(m, slen);
>  }
>  
> -static void parse_config_file(const char *map, size_t len)
> +static void parse_config_file(const char *p)
>  {
> -	const int *end = (const int *) (map + len);
> -	/* start at +1, so that p can never be < map */
> -	const int *m   = (const int *) map + 1;
> -	const char *p, *q;
> -
> -	for (; m < end; m++) {
> -		if (*m == INT_CONF) { p = (char *) m  ; goto conf; }
> -		if (*m == INT_ONFI) { p = (char *) m-1; goto conf; }
> -		if (*m == INT_NFIG) { p = (char *) m-2; goto conf; }
> -		if (*m == INT_FIG_) { p = (char *) m-3; goto conf; }
> -		continue;
> -	conf:
> -		if (p > map + len - 7)
> -			continue;
> -		if (memcmp(p, "CONFIG_", 7))
> -			continue;
> +	const char *q, *r;
> +
> +	while ((p = strstr(p, "CONFIG_"))) {
>  		p += 7;
> -		for (q = p; q < map + len; q++) {
> -			if (!(isalnum(*q) || *q == '_'))
> -				goto found;
> -		}
> -		continue;
> -
> -	found:
> -		if (!memcmp(q - 7, "_MODULE", 7))
> -			q -= 7;
> -		if (q - p < 0)
> -			continue;
> -		use_config(p, q - p);
> +		q = p;
> +		while (*q && (isalnum(*q) || *q == '_'))
> +			q++;
> +		if (memcmp(q - 7, "_MODULE", 7) == 0)
> +			r = q - 7;
> +		else
> +			r = q;
> +		if (r > p)
> +			use_config(p, r - p);
> +		p = q;
>  	}
>  }
Faster and simpler - good.

>  
> @@ -291,7 +275,7 @@ static void do_config_file(const char *filename)
>  {
>  	struct stat st;
>  	int fd;
> -	void *map;
> +	char *map;
>  
>  	fd = open(filename, O_RDONLY);
>  	if (fd < 0) {
> @@ -308,18 +292,23 @@ static void do_config_file(const char *filename)
>  		close(fd);
>  		return;
>  	}
> -	map = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
> -	if ((long) map == -1) {
> -		perror("fixdep: mmap");
> +	map = malloc(st.st_size + 1);
> +	if (!map) {
> +		perror("fixdep: malloc");
>  		close(fd);
>  		return;
>  	}
> +	if (read(fd, map, st.st_size) != st.st_size) {
> +		perror("fixdep: read");
> +		close(fd);
> +		return;
> +	}
> +	map[st.st_size] = '\0';
> +	close(fd);
>  
> -	parse_config_file(map, st.st_size);
> -
> -	munmap(map, st.st_size);
> +	parse_config_file(map);
>  
> -	close(fd);
> +	free(map);
>  }
This change is not described in the changelog..
What is the rationale?

	Sam
