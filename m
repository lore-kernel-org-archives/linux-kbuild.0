Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:32936 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752758AbcHXHTK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Aug 2016 03:19:10 -0400
Received: by mail-lf0-f68.google.com with SMTP id f93so385151lfi.0
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Aug 2016 00:19:09 -0700 (PDT)
Date: Wed, 24 Aug 2016 10:19:16 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH] fixdep: faster CONFIG_ search
Message-ID: <20160824071916.GA1844@p183.telecom.by>
References: <20160823184724.GA11707@p183.telecom.by>
 <20160824050108.GA19050@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160824050108.GA19050@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: mmarek@suse.com, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

On Wed, Aug 24, 2016 at 07:01:08AM +0200, Sam Ravnborg wrote:
> > -	map = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
> > -	if ((long) map == -1) {
> > -		perror("fixdep: mmap");
> > +	map = malloc(st.st_size + 1);
> > +	if (!map) {
> > +		perror("fixdep: malloc");
> >  		close(fd);
> >  		return;
> >  	}
> > +	if (read(fd, map, st.st_size) != st.st_size) {
> > +		perror("fixdep: read");
> > +		close(fd);
> > +		return;
> > +	}
> > +	map[st.st_size] = '\0';
> > +	close(fd);
> >  
> > -	parse_config_file(map, st.st_size);
> > -
> > -	munmap(map, st.st_size);
> > +	parse_config_file(map);
> >  
> > -	close(fd);
> > +	free(map);
> >  }
> This change is not described in the changelog..
> What is the rationale?

There is no raw memory equivalent of strstr(), so a file is made into
a string.
